import {
  MetaEdEnvironment,
  DomainEntity,
  Namespace,
  newMetaEdEnvironment,
  newDomainEntity,
  addEntityForNamespace,
  newNamespace,
  newDomainEntityProperty,
} from 'metaed-core';
import { enhance } from '../../src/enhancer/DomainEntityGraphReferenceEnhancer';
import { enhance as initialize, graphReferences } from '../../src/model/OrgGraphEntityRepository';

describe('when enhancing domain entity', () => {
  const namespace: Namespace = { ...newNamespace(), namespaceName: 'example' };
  const metaEd: MetaEdEnvironment = { ...newMetaEdEnvironment(), dataStandardVersion: '3.0.0' };
  metaEd.namespace.set(namespace.namespaceName, namespace);
  const entityName = 'EntityName';
  const referencedEntityName = 'ReferencedEntityName';

  const domainEntity: DomainEntity = {
    ...newDomainEntity(),
    metaEdName: entityName,
    namespace,
    properties: [
      {
        ...newDomainEntityProperty(),
        metaEdName: referencedEntityName,
      },
    ],
  };
  addEntityForNamespace(domainEntity);

  beforeAll(() => {
    initialize(metaEd);
    enhance(metaEd);
  });

  it('should have graph reference for relationship', () => {
    const references = graphReferences(metaEd, namespace);
    expect(references).toHaveLength(1);
    expect(references[0].sourceEntityName).toBe(entityName);
    expect(references[0].targetEntityName).toBe(referencedEntityName);
  });
});
