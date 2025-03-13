# Crowdbotics Clean Room
This project is a way to create a secure, ephemeral environment for Crowdbotics Code to Spec customers.


![image](/images/azure-landing-zone-architecture-diagram-hub-spoke.svg)

### Steps to bootstrap

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

$ az login
$ az account show
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"

$ export ARM_CLIENT_ID="<APPID_VALUE>"
$ export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
$ export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
$ export ARM_TENANT_ID="<TENANT_VALUE>"

$ terraform init
$ terraform plan
$ terraform apply
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | region which the application should be deployed and run | string | westus2 | yes |
| repository_url | the URI of the Git repo for the appliction | url | Azure Sample App | yes |
| enable_telemetry | enable telemetry for the deployment | bool | true | no |


## Outputs
| Name | Description |
|------|-------------|
| app_name | randomized name of the application |
| app_url | URL to access the application |
