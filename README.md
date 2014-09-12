# uzyexe/terraform

## What is terraform

Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved.

Simple file based configuration gives you a single view of your entire infrastructure.

[http://www.terraform.io/](http://www.terraform.io/)

## Dockerfile

[**Trusted Build**](https://registry.hub.docker.com/u/uzyexe/terraform/)

This Docker image is based on the Official [busybox:ubuntu-14.04
](https://registry.hub.docker.com/_/busybox/) base image.

## How to use this image

```
docker run -rm uzyexe/terraform <additional param>
```

## Using

**Please note: Create by your Terraform configuration files (.tf) is `/data` directory**

### terraform plan

```
docker run -v /etc/ssl/certs:/etc/ssl/certs:ro -v /data:/data uzyexe/terraform plan
```

### terraform apply

```
docker run -v /etc/ssl/certs:/etc/ssl/certs:ro -v /data:/data uzyexe/terraform apply
```

### terraform show

```
docker run -v /data:/data uzyexe/terraform show terraform.tfstate
```

### terraform graph

```
docker run -v /data:/data uzyexe/terraform graph
```

### terraform output

```
docker run -v /data:/data uzyexe/terraform output [options] NAME
```

### terraform refresh

```
docker run -v /etc/ssl/certs:/etc/ssl/certs:ro -v /data:/data uzyexe/terraform refresh
```

### terraform version

```
docker run uzyexe/terraform version
```

