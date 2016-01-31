# uzyexe/terraform [![Circle CI](https://circleci.com/gh/uzyexe/dockerfile-terraform/tree/master.svg?style=svg)](https://circleci.com/gh/uzyexe/dockerfile-terraform/tree/master)

## What is terraform

Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved.

Simple file based configuration gives you a single view of your entire infrastructure.

[http://www.terraform.io/](http://www.terraform.io/)

## Dockerfile

[**Trusted Build**](https://registry.hub.docker.com/u/uzyexe/terraform/)

This Docker image is based on the official [alpine:3.2](https://registry.hub.docker.com/_/alpine/) base image.

## How to use this image

```
docker run uzyexe/terraform [--version] [--help] <command> [<args>]

```

## Using

**Please note: Create by your Terraform configuration files (.tf) is `/data` directory**

### terraform apply

```
docker run --rm -v /data:/data uzyexe/terraform apply [options]
```

### terraform destroy

```
docker run --rm -v /data:/data uzyexe/terraform destroy [options] [DIR]
```

### terraform get

```
docker run --rm -v /data:/data uzyexe/terraform get [options] PATH
```

### terraform graph

```
docker run --rm -v /data:/data uzyexe/terraform graph [options]
```

### terraform init

```
docker run --rm -v /data:/data uzyexe/terraform init [options] SOURCE [PATH]
```

### terraform output

```
docker run --rm -v /data:/data uzyexe/terraform output [options] NAME
```

### terraform plan

```
docker run --rm -v /data:/data uzyexe/terraform plan [options]
```

### terraform push

```
docker run --rm -v /data:/data uzyexe/terraform push [options]
```

### terraform refresh

```
docker run --rm -v /data:/data uzyexe/terraform refresh [options]
```

### terraform remote

```
docker run --rm -v /data:/data uzyexe/terraform remote [options]
```

### terraform show

```
docker run --rm -v /data:/data uzyexe/terraform show terraform.tfstate [options]
```

### terraform taint

```
docker run --rm -v /data:/data uzyexe/terraform taint [options] name
```

### terraform version

```
docker run --rm uzyexe/terraform version
```
