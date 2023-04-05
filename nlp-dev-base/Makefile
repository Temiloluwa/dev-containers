REGION := us-east-1
ACCOUNT_ID := 222311789433
REPO_NAME := dev-containers/nlp-dev-base
IMAGE_TAG := 2.0.0
KEY_ID ?= aws-programmatic-key-id-as-env-variable
KEY_VALUE ?= aws-programmatic-key-value-as-env-variable

ecr_login:
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com

ecr_create_repo:
	aws --region $(REGION) ecr create-repository --repository-name $(REPO_NAME)
	
ecr_build:
	docker build --build-arg keyId=$(KEY_ID) --build-arg keyValue=$(KEY_VALUE) . --no-cache -t $(IMAGE_TAG) -t $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):$(IMAGE_TAG)

ecr_push:
	docker push $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):$(IMAGE_TAG)