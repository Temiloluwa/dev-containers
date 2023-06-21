# default arguments
keyId=$1
keyValue=$2
testVar=$3
sshKey=macbook-ssh-private-key
sshRoot="/home/vscode/.ssh"
sshKeyPath="/home/vscode/.ssh/id_rsa"
awsProfile=tobi

# install awscli
apt-get update --allow-releaseinfo-change && apt-get install -y apt-transport-https
apt-get install -y curl unzip groff less wget
apt install make -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip && ./aws/install

# aws configure an aws profile - get credentials from parameter store
echo "******* Test Value *******"
echo $testVar

aws configure --profile $awsProfile
aws configure set aws_access_key_id $keyId
aws configure set aws_secret_access_key $keyValue
aws configure set default.region us-east-1

# get ssh credentials from secrets manager
mkdir -p $sshRoot
aws secretsmanager get-secret-value --secret-id $sshKey --query SecretString --output text > $sshKeyPath
chmod 400 $sshKeyPath
