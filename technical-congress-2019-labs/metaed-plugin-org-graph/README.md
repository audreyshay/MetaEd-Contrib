# Yeoman-generated Example

This is a plugin to generate simple graphs of Domain Entities as dot graph files, viewable online using [this website](https://dreampuf.github.io/GraphvizOnline/).  To use the plugin, first download all of the third-party npm packages with:
```
yarn install
```
Then, confirm everything is working correctly with:
```
yarn test
```
Then, transpile the plugin with:
```
yarn build
```
And finally, link the plugin into your existing MetaEd IDE installation with something like:
```
mklink /J C:\MetaEd-IDE\node_modules\metaed-plugin-org-graph C:\metaed-tc-2019-labs\metaed-plugin-org-graph
```
where in this example the MetaEd IDE installation is in `C:\MetaEd-IDE` and the labs are located at `C:\metaed-tc-2019-labs`.  Open the MetaEd IDE, and the plugin should be shown as loaded in the `MetaEd -> About` tab.