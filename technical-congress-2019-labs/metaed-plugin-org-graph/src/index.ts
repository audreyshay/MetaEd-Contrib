import { MetaEdPlugin } from 'metaed-core';
import { newMetaEdPlugin } from 'metaed-core';

import { enhance as orgGraphEntityRepositorySetupEnhancer } from './model/OrgGraphEntityRepository';
import { enhance as domainEntityGraphReferenceEnhancer } from './enhancer/DomainEntityGraphReferenceEnhancer';

import { generate as domainEntityGraphReferenceGenerator } from './generator/DomainEntityGraphReferenceGenerator';

export function initialize(): MetaEdPlugin {
  return Object.assign(newMetaEdPlugin(), {
    enhancer: [orgGraphEntityRepositorySetupEnhancer, domainEntityGraphReferenceEnhancer],
    generator: [domainEntityGraphReferenceGenerator],
  });
}
