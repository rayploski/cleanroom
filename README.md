# Crowdbotics Clean Room
This project is a way to create a secure, ephemeral environment for Crowdbotics Code to Spec customers.



brew tap hashicorp/tap
brew install hashicorp/tap/terraform


`
$ az login
$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
$ export ARM_CLIENT_ID="<APPID_VALUE>"
$export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
$ export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
$export ARM_TENANT_ID="<TENANT_VALUE>"
`



## Azure Environment Variables
- ARM_CLIENT_ID
- ARM_CLIENT_SECRET
- ARM_TENANT_ID
- ARM_SUBSCRIPTION_ID