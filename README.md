# docker-aws-azure-ad

This container is used to perform AWS SSO using Azure AD.
The image was bases on https://github.com/sportradar/aws-azure-login

It exports the AWS vars to the /work/.env

## How to use
Inside the docker-compose

```
services:
  azure-auth:
      image: dnxsolutions/docker-aws-azure-ad:1.0.0
      volumes:
        - ./.env.auth:/work/.env
      environment:
        - AZURE_TENANT_ID
        - AZURE_APP_ID_URI

This image requires two Azure AD environemnt variables
- AZURE_TENANT_ID, to check the correct value, please log in into Azure portal -> AD -> Tenant ID is displayed
- AZURE_APP_ID_URI, to check the correct value, please log in into Azure portal -> AD -> Enterprise Applications -> Amazon Web Services (AWS)  -> Application ID is displayed 