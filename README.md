# Keycloak

Keycloak is an Open Source Identity and Access Management solution for modern Applications and Services.

This repository contains the source code for the Keycloak Server, Java adapters and the JavaScript adapter.


## Help and Documentation

* [Documentation](https://www.keycloak.org/documentation.html)
* [User Mailing List](https://lists.jboss.org/mailman/listinfo/keycloak-user) - Mailing list for help and general questions about Keycloak
* [JIRA](https://issues.jboss.org/projects/KEYCLOAK) - Issue tracker for bugs and feature requests


## Reporting Security Vulnerabilities

If you've found a security vulnerability, please look at the [instructions on how to properly report it](http://www.keycloak.org/security.html)


## Reporting an issue

If you believe you have discovered a defect in Keycloak please open an issue in our [Issue Tracker](https://issues.jboss.org/projects/KEYCLOAK).
Please remember to provide a good summary, description as well as steps to reproduce the issue.


## Getting started

To run Keycloak download the distribution from our [website](https://www.keycloak.org/downloads.html). Unzip and run:

    bin/standalone.[sh|bat] 

Alternatively, you can use the Docker image by running:

    docker run jboss/keycloak
    
For more details refer to the [Keycloak Documentation](https://www.keycloak.org/documentation.html).


## Building from Source

To build from source refer to the [building and working with the code base](docs/building.md) guide.


### Testing

To run tests refer to the [running tests](docs/tests.md) guide.


### Writing Tests

To write tests refer to the [writing tests](docs/tests-development.md) guide.


## Contributing

Before contributing to Keycloak please read our [contributing guidelines](CONTRIBUTING.md).


## Other Keycloak Projects

* [Keycloak](https://github.com/keycloak/keycloak) - Keycloak Server and Java adapters
* [Keycloak Documentation](https://github.com/keycloak/keycloak-documentation) - Documentation for Keycloak
* [Keycloak QuickStarts](https://github.com/keycloak/keycloak-quickstarts) - QuickStarts for getting started with Keycloak
* [Keycloak Docker](https://github.com/jboss-dockerfiles/keycloak) - Docker images for Keycloak
* [Keycloak Gatekeeper](https://github.com/keycloak/keycloak-gatekeeper) - Proxy service to secure apps and services with Keycloak
* [Keycloak Node.js Connect](https://github.com/keycloak/keycloak-nodejs-connect) - Node.js adapter for Keycloak
* [Keycloak Node.js Admin Client](https://github.com/keycloak/keycloak-nodejs-admin-client) - Node.js library for Keycloak Admin REST API


## License

* [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)


## Docker Theme Copy
    sudo docker cp themes/src/main/resources/theme/heysign dcfc003bf641:/opt/jboss/keycloak/themes/heysign

## Docker Theme Test
    cd testsuite/utils
    mvn clean package
    mvn exec:java -Pkeycloak-server -Dresources -Pkeycloak.theme.dir="../../themes/src/main/resources/theme"
    mvn exec:java -Pkeycloak-server -Dresources -Pkeycloak.theme.dir="../../themes/src/main/resources/theme" -Dimport="../../../heysign-service/src/main/docker/realm-config/heysign-realm.json"
    Use following url for debugging: http://localhost:8081/auth/realms/heysign/account

## intellij debug setting

####create maven run 
#### set working directory:
    keycloak/testsuite/utils
#### set command line:
    exec:java -Dkeycloak.port=9977 -Dresources -Pkeycloak.theme.dir=../../themes/src/main/resources/theme "-Dimport=../../../heysign-service/src/main/docker/realm-config/heysign-realm.json"
#### set profiles:
    keycloak-server

## command line
    mvn exec:java -Pkeycloak-server -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=dir -Dkeycloak.migration.dir=./realm-config -Dkeycloak.migration.strategy=OVERWRITE_EXISTING -Djboss.socket.binding.port-offset=1000 -Djboss.as.management.blocking.timeout=6000 -Dkeycloak.port=9977 -Dkeycloak.connectionsJpa.driver=com.mysql.jdbc.Driver -Dkeycloak.connectionsJpa.password=heysign2020!1 -Dkeycloak.connectionsJpa.user=hsuser -Dresources -Pkeycloak.theme.dir="../../themes/src/main/resources/theme" -Dimport="../../../heysign-service/src/main/docker/realm-config/heysign-realm.json" -Dkeycloak.connectionsJpa.url="jdbc:mysql://localhost:3316/keycloak?useUnicode=true&characterEncoding=utf8&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&createDatabaseIfNotExist=true"