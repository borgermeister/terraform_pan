# Instructions how to use this repository

## Install Terraform locally
[Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Get API key from firewall
`curl -k -X GET "https://10.10.10.10/api/?type=keygen&user=terraform&password=SecretPassword%23"`
// Use https://www.urlencoder.org if password contains special characters like '# $ %'

## Create environmental variables
```bash
export TF_VAR_PANOS_HOSTNAME=10.10.10.10
export TF_VAR_PANOS_USERNAME=terraform
export TF_VAR_PANOS_API_KEY=LUFRPT1UaHpwUVhtWjdNdkhCeG1NNTZROUh.....
```

## Update variables
Change file 'pan.auto.tfvars' with your own variables
