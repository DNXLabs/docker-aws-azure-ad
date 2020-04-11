# docker-aws-azure-ad

This container is used to perform AWS SSO using Azure AD.
The image was bases on https://github.com/sportradar/aws-azure-login

It exports the AWS vars to the /work/.env

## How to use
Inside the docker-compose

```
azure-auth:
    image: dnxsolutions/aws-azure-ad:1.0.0
    volumes:
      - ./.env.auth:/work/.env
    environment:
      - AZURE_TENANT_ID
      - AZURE_APP_ID_URI