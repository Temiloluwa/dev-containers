
REGION := us-east-1
ACCOUNT_ID := 392525434032
REPO_NAME := dev-containers/nlp-dev-base
IMAGE_TAG := 1.0.0

ecr_login:
	aws ecr get-login-password --region $(REGION) | docker login --username AWS --password-stdin $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com:$(IMAGE_TAG)

ecr_create_repo:
	aws --region $(REGION) ecr create-repository --repository-name $(REPO_NAME)
	
ecr_build:
	docker build . -t $(IMAGE_TAG) -t $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):$(IMAGE_TAG)

ecr_push:
	docker push $(ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/$(REPO_NAME):$(IMAGE_TAG)