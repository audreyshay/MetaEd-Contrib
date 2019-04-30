import { MetaEdPlugin } from 'metaed-core';
import { newMetaEdPlugin } from 'metaed-core';

import { generate as dwGenerator } from './generator/DwGenerator';

export function initialize(): MetaEdPlugin {
  return Object.assign(newMetaEdPlugin(), {
    generator: [dwGenerator],
  });
}
