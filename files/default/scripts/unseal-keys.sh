vault operator init -format=json -key-shares=3 -key-threshold=2 > vault-keys.json
REGION=`curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
aws s3 cp vault-keys.json s3://terraform-veeru-remote --region=$REGION

key1=`cat vault-keys.json | jq '.unseal_keys_b64[0]' | tr -d '"'`
key2=`cat vault-keys.json | jq '.unseal_keys_b64[1]' | tr -d '"'`
key3=`cat vault-keys.json | jq '.unseal_keys_b64[2]' | tr -d '"'`
root_token=`cat vault-keys.json | jq '.root_token'| tr -d '"'`


vault operator unseal $key1
vault operator unseal $key2
vault operator unseal $key3

