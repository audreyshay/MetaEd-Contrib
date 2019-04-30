import { promisify } from 'util';
import path from 'path';
import fs from 'fs';
import handlebars from 'handlebars';
import { tableEntities, Table } from 'metaed-plugin-edfi-ods';
import { MetaEdEnvironment, GeneratorResult, GeneratedOutput, orderByProp } from 'metaed-core';

// node 8.0+ wrapper to enable async/await on file read
const readFile = promisify(fs.readFile);

// utility function to sort tables by name
const sortByName = orderByProp('name');

// Handlebars instance scoped for this plugin
export const domainEntityNameHandlebars = handlebars.create();

// standard generator function signature
export async function generate(metaEd: MetaEdEnvironment): Promise<GeneratorResult> {
  const results: Array<GeneratedOutput> = [];

  // Compile the Handlebars template file, return custom handlebars function to apply data to our template
  const templateBuffer = await readFile(path.join(__dirname, 'templates', 'table.hbs'));
  const templateFunction: (Object) => string = domainEntityNameHandlebars.compile(templateBuffer.toString());

  // Get all ODS plugin tables in all namespaces
  metaEd.namespace.forEach(namespace => {
    const tables: Array<Table> = sortByName([...tableEntities(metaEd, namespace).values()]);

    // Namespace might not have any tables, avoid empty file
    if (tables.length > 0) {
      // Feed Tables to table.hbs template
      const resultString: string = templateFunction({ tables });

      // Provide result with file metadata
      // One file per namespace that has tables
      // It will be named domainEntityNames.txt and placed in the Documentation/Names folder
      const fileName = `${namespace.namespaceName}-DW.sql`;

      results.push({
        name: 'DW.sql',
        namespace: namespace.namespaceName,
        folderName: '/Database/SQLServer/ODS/DW/',
        fileName,
        resultString,
        resultStream: null,
      });
    }
  });

  return {
    generatorName: 'edfiOds.IdIndexesGenerator',
    generatedOutput: results,
  };
}
