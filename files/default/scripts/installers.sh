yum -y update
yum install wget -y
wget http://stedolan.github.io/jq/download/linux64/jq
chmod +x ./jq
cp jq /usr/bin

easy_install pip

# Install aws cli
pip install awscli --upgrade

