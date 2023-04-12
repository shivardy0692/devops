## Terraform
````sh
terraform init --> it will download the necessary provider to interact with the aws or azure cloud. (initializing modules and provider plugins)
terraform plan --> it means simulation (It will shows how many resources we are going to add, change and destroy)
terrafoem apply --auto-approve --> it means deployment, after deplyment we will get statefile.
terraform import <resource_name> <resource_id>(we will get it from aws or azure cloud) --> to recover statefile. 
terraform backend s3 --> it will store the state file in remote location (when we are doing activity on tf file that time acquiring state lock will come)

terraform plan --target=module.<declare module name>
terraform apply --target=module.<declare module name>
terraform destroy --target=module.<declare module name> ex: module.prod
````

## Variables
![image](https://user-images.githubusercontent.com/48147995/223608390-2af2c052-16c4-49a7-88e6-22c7033d6a39.png)

## Statefile
![image](https://user-images.githubusercontent.com/48147995/223608555-bfe6efd6-6fbe-436c-9f08-025f8d298cd1.png)

## Terraform Import
![image](https://user-images.githubusercontent.com/48147995/223615948-17b3bfb8-d818-4004-8d25-1e0408aab222.png)

## Terraform lock file:
