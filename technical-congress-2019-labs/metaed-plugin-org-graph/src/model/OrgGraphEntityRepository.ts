import { newPluginEnvironment, EnhancerResult, MetaEdEnvironment, Namespace, PluginEnvironment } from 'metaed-core';
import { GraphReference } from './GraphReference';

// definition of the plugin-specific entity repository, in this case just one collection
export type OrgGraphEntityRepository = {
  graphReference: Array<GraphReference>;
};

// Plugin-specific entity repository initialization is a "setup" enhancer, name prefixed as the parent object type
const enhancerName = 'OrgGraphEntityRepositorySetupEnhancer';

// create a new, empty repository
export function newOrgGraphEntityRepository(): OrgGraphEntityRepository {
  return {
    graphReference: [],
  };
}

// add a new, empty plugin-specific repository - one for each namespace
export function addOrgGraphEntityRepository(metaEd: MetaEdEnvironment) {
  // store as a map of namespaces to repositories
  const namespaces: Map<Namespace, OrgGraphEntityRepository> = new Map();
  metaEd.namespace.forEach((namespace: Namespace) => {
    namespaces.set(namespace, newOrgGraphEntityRepository());
  });

  // get "this" plugin to attach namespace -> repository map to
  const orgGraphPlugin = metaEd.plugin.get('orgGraph');

  // this should never be null, except in test scenarios
  if (orgGraphPlugin == null) {
    metaEd.plugin.set('orgGraph', { ...newPluginEnvironment(), shortName: 'orgGraph', namespace: namespaces });
  } else {
    orgGraphPlugin.namespace = namespaces;
  }
}

// standard enhancer function signature
export function enhance(metaEd: MetaEdEnvironment): EnhancerResult {
  addOrgGraphEntityRepository(metaEd);

  return {
    enhancerName,
    success: true,
  };
}

function orgGraphEntityRepositoryForNamespace(
  metaEd: MetaEdEnvironment,
  namespace: Namespace,
): OrgGraphEntityRepository | null {
  const plugin: PluginEnvironment | undefined = metaEd.plugin.get('orgGraph');
  // if plugin not there, something's very wrong
  if (plugin == null) return null;
  const orgGraphEntityRepository: OrgGraphEntityRepository | undefined = plugin.namespace.get(namespace);
  // if repository for namespace not there, something's very wrong
  return orgGraphEntityRepository == null ? null : orgGraphEntityRepository;
}

export function graphReferences(metaEd: MetaEdEnvironment, namespace: Namespace): Array<GraphReference> {
  const repository: OrgGraphEntityRepository | null = orgGraphEntityRepositoryForNamespace(metaEd, namespace);
  return repository == null ? [] : repository.graphReference;
}
