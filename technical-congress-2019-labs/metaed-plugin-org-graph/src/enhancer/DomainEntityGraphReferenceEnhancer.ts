import { MetaEdEnvironment, EnhancerResult, getEntitiesOfTypeForNamespaces, DomainEntity } from 'metaed-core';
import { graphReferences } from '../model/OrgGraphEntityRepository';

// Enhancer that populates graph references for DomainEntitiesx
const enhancerName = 'DomainEntityGraphReferenceEnhancer';

// standard enhancer function signature
export function enhance(metaEd: MetaEdEnvironment): EnhancerResult {
  // Loop over all namespaces
  metaEd.namespace.forEach(namespace => {
    // graph reference in repository for this namespace
    const graphReferencesForNamespace = graphReferences(metaEd, namespace);
    getEntitiesOfTypeForNamespaces([namespace], 'domainEntity').forEach(entity => {
      const domainEntity = entity as DomainEntity;
      domainEntity.properties.forEach(property => {
        // domain entity properties are what we are looking for
        if (property.type === 'domainEntity') {
          graphReferencesForNamespace.push({
            sourceEntityName: domainEntity.metaEdName,
            targetEntityName: property.metaEdName,
          });
        }
      });
    });
  });

  return {
    enhancerName,
    success: true,
  };
}
