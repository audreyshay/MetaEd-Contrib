# Yeoman-generated Example

This is a version of the plugin that the MetaEd Plugin Generator will create when all of the defaults are taken.  To use it, first download all of the third-party npm packages with:
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
mklink /J C:\MetaEd-IDE\node_modules\metaed-plugin-org-example C:\metaed-tc-2019-labs\metaed-plugin-org-example
```
where in this example the MetaEd IDE installation is in `C:\MetaEd-IDE` and the labs are located at `C:\metaed-tc-2019-labs`.  Open the MetaEd IDE, and the plugin should be shown as loaded in the `MetaEd -> About` tab.