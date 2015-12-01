
[![Build Status](https://travis-ci.org/combor/docker-terraform.svg)](https://travis-ci.org/combor/docker-terraform)
# docker-terraform

This container allows to run Terraform ( 0.6.7 ) inside docker container. You need to export your credencials as envirnoment variables. For AWS it needs ```TF_VAR_AWS_ACCESS_KEY_ID``` and ```TF_VAR_AWS_SECRET_ACCESS_KEY```

## How to run and build

- ```git clone https://github.com/combor/docker-terraform.git```
- ```cd docker-terraform```
- ```docker build -t terraform .```

## How to run it

```
docker run -ti \
        -e TF_VAR_AWS_ACCESS_KEY_ID=$TF_VAR_AWS_ACCESS_KEY_ID \
        -e TF_VAR_AWS_SECRET_ACCESS_KEY=$TF_VAR_AWS_SECRET_ACCESS_KEY \
        terraform
```
