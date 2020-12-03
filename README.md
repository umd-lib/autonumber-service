# autonumber-service

Rails implementation of the Autonumber service.

This is a reimplementation of the Autonumber service from the
[Grails Services][grails] app.

## Quick Start

Requires:

* Ruby 2.2.4
* Bundler (v1.17.3 or earlier)

```
git clone git@github.com:umd-lib/autonumber-service
cd autonumber-service
bundle install --without production --path vendor
rails server
```

<http://localhost:3000/auto_numbers>

## Docker Image

This application provides a "Dockerfile" for generating a Docker image for use
in production. The Dockerfile provides a sample build command.

The "docker_config" directory contains files copied into the Docker image.

In order to generate "clean" Docker images, the Docker images should be built
from a fresh clone of the GitHub repository.

## Docker.ci and Jenkinsfile

The "Dockerfile.ci" file is used to encapsulate the environment needed by the
continuous integration (ci) server for building and testing the application.

The "Jenkinsfile" provides the Jenkins pipeline steps for building and
testing the application.

## Production Environment Configuration

**Note:** The following is largely obsolete, as Kubernetes is now used for
running in production. See [umd-lib/k8s-autonumber][k8s-autonumber].

Requires:

* Postgres client to be installed (on RedHat, the "postgresql" and
"postgresql-devel" packages)

The application uses the "dotenv" gem to configure the production environment.
The gem expects a ".env" file in the root directory to contain the environment
variables that are provided to Ruby. A sample "env_example" file has been
provided to assist with this process. Simply copy the "env_example" file to
".env" and fill out the parameters as appropriate.

The configured .env file should _not_ be checked into the Git repository, as it
contains credential information.

[grails]: https://github.com/umd-lib/grails-services
[k8s-autonumber]: https://github.com/umd-lib/k8s-autonumber
