import { promisify } from 'util';
import path from 'path';
import fs from 'fs';
import handlebars from 'handlebars';
import { MetaEdEnvironment, GeneratorResult, GeneratedOutput } from 'metaed-core';
import { graphReferences } from '../model/OrgGraphEntityRepository';
import { GraphReference } from '../model/GraphReference';

// node 8.0+ wrapper to enable async/await on file read
const readFile = promisify(fs.readFile);

// Handlebars instance scoped for this plugin
export const domainEntityNameHandlebars = handlebars.create();

// standard generator function signature
export async function generate(metaEd: MetaEdEnvironment): Promise<GeneratorResult> {
  const results: Array<GeneratedOutput> = [];

  // Compile the Handlebars template file, return custom handlebars function to apply data to our template
  const templateBuffer = await readFile(path.join(__dirname, 'templates', 'GraphReference.hbs'));
  const templateFunction: (Object) => string = domainEntityNameHandlebars.compile(templateBuffer.toString());

  // Get all graph references in all namespaces
  metaEd.namespace.forEach(namespace => {
    const references: Array<GraphReference> = graphReferences(metaEd, namespace);

    // Namespace might not have any references, avoid empty file
    if (references.length > 0) {
      // Feed references to template
      const resultString: string = templateFunction({ references });

      // Provide result with file metadata
      // One file per namespace that has graph references
      const fileName = `${namespace.namespaceName}.dot`;

      results.push({
        name: fileName,
        namespace: namespace.namespaceName,
        folderName: '/GraphReference/',
        fileName,
        resultString,
        resultStream: null,
      });
    }
  });

  return {
    generatorName: 'DomainEntityGraphReferenceGenerator',
    generatedOutput: results,
  };
}
