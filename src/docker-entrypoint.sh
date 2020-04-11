#!/bin/bash
echo "--> Accessing Azure AD"
set -e -o pipefail


mkdir .aws
envsubst < config.tpl > /root/.aws/config
aws-azure-login --no-sandbox

echo "" >> /work/.env
echo AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id) >> /work/.env
echo AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key) >> /work/.env
echo AWS_SECURITY_TOKEN=$(aws configure get aws_security_token) >> /work/.env
echo AWS_SESSION_EXPIRATION=$(aws configure get aws_session_expiration) >> /work/.env
echo AWS_SESSION_TOKEN=$(aws configure get aws_session_token) >> /work/.env

"$@"