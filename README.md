# About
obsolete-version-manager is Tieto project for Alfresco virtual Hackathon 2018

The main idea of this project is to implement "manager" which would take care of versions. 

For example:
1. Keep only x latest versions on fast (default) content store and move older ones to slow content store
2. Keep just x latest versions and remove remaining
3. Remove versions older than specific time

# Default configuration
There are four different custom content stores used in this project:
* defaultTenantFileContentStore - Works in the same way as Alfresco default content store. Content is stored under ${dir.contentstore}
* fastFileStore - Used especially for demonstration purposes. Content is stored under ${dir.root}\\fastStore
* slowFileStore - Same as above. Content is stored under ${dir.root}\\slowStore
* propertyRoutingStore - This "facade" store decides which content store will be used based on cm:storeName property defined in cm:storeSelector aspect 

All 4 content stores are configured in [alfresco-global.properties](/obsolete-version-manager-repo/src/main/resources/alfresco/module/obsolete-version-manager-repo/alfresco-global.properties) 

# Build
Since this addon uses [Selector Property Store](https://github.com/Acosix/alfresco-simple-content-stores/wiki/Selector-Property-Store) feature which is implemented as part of [alfresco-simple-content-stores](https://github.com/Acosix/alfresco-simple-content-stores), several mandatory dependencies are automatically added.

Those dependecies are defined in repo/share pom file. You can check and change module versions if needed. Following modules are used:

**Repository**
* de.acosix.alfresco.utility.repo
* de.acosix.alfresco.simplecontentstores.repo
* support-tools-repo
* javascript-console-repo

**Share**
* support-tools-share
* javascript-console-share

We decided to use the latest (snapshot) versions of [Acosix/alfresco-utility](https://github.com/Acosix/alfresco-utility.git) and [Acosix/alfresco-simple-content-stores](https://github.com/Acosix/alfresco-simple-content-stores.git). Therefore, [ossrh](https://github.com/FilipBruska/obsolete-version-manager/blob/40ddfea93613c70fa84c47069775ba87e4c62052/obsolete-version-manager-repo/pom.xml#L371-L378) repository was added to repo pom file.

## Another options how to build the project
One advice for following methods, be sure that you are using the same version in pom file as in your local repo.

### Build external modules by yourself
Just clone following repositories and execute `mvn install`
* [Acosix/alfresco-utility](https://github.com/Acosix/alfresco-utility.git)
* [Acosix/alfresco-simple-content-stores](https://github.com/Acosix/alfresco-simple-content-stores.git)
* [OrderOfTheBee/ootbee-support-tools](https://github.com/OrderOfTheBee/ootbee-support-tools.git)
* [share-extras/js-console](https://github.com/share-extras/js-console.git)