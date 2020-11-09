VERSION = 1.0.0
IMAGE_NAME ?= dnxsolutions/docker-aws-azure-ad:$(VERSION)
TAG = $(VERSION)

build:
	docker build -t $(IMAGE_NAME) .

shell:
# -v ~/.aws:/root/.aws
	docker run --rm -it -e AZURE_TENANT_ID=60c1e496-337d-46fb-b3e6-c697d4f142c7 -e AZURE_APP_ID_URI=f9170b79-e26e-4fbf-bfb4-f2304fc735ac $(IMAGE_NAME) bash

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
