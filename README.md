# Unif.io Terraform Dockerfile
[![Circle CI](https://circleci.com/gh/unifio/dockerfile-terraform.svg?style=svg)](https://circleci.com/gh/unifio/dockerfile-terraform)

## What is terraform

Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved.

Simple file based configuration gives you a single view of your entire infrastructure.

[http://www.terraform.io/](http://www.terraform.io/)

## Dockerfile

This Docker image is based on the official [alpine:3.4](https://hub.docker.com/_/alpine/) base image.

## Enhancements

* Includes Git and Mercurial for sourcing Terraform modules.
* Includes [gosu](https://github.com/tianon/gosu) for optionally changing the user that executes Terraform.

## How to use this image

```
docker run --rm unifio/terraform [--version] [--help] <command> [<args>]
```

In Continuous Integration (CI) environments it can often be a problem if the container leaves behind artifacts owned by the root user that then prevent clean-up of the build workspace.
You can optionally coordinate the UID of the build user and the user within the container by passing the `LOCAL_USER_ID` environment variables into the container.

For example:

```
docker run -e LOCAL_USER_ID=$UID --rm unifio/terraform [--version] [--help] <command> [<args>]
```

With debugging output to log which UID was used:

```
docker run -e LOCAL_USER_ID=$UID -e DEBUG=true --rm unifio/terraform [--version] [--help] <command> [<args>]
```