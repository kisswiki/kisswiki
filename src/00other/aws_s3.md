## install pip for python 2.7.x

`sudo apt-get install python-pip`

http://www.neuraldump.com/2017/01/how-to-install-pip-on-ubuntu-16-10-yakkety-yak/

## install aws-cli

`sudo pip install awscli`

https://github.com/aws/aws-cli

## configure aws

`aws configure`

- http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
- https://www.cloudberrylab.com/blog/how-to-find-your-aws-access-key-id-and-secret-access-key-and-register-with-cloudberry-s3-explorer/

## get data

`aws s3api list-objects --bucket bhutandev --page-size 100 > objects.json`

- http://docs.aws.amazon.com/cli/latest/userguide/pagination.html
- http://docs.aws.amazon.com/cli/latest/reference/s3api/list-objects.html

## put file

```
aws s3api put-object --bucket bhutandev --key passport/rofrol.jpg --body /home/romanfrolow/Pobrane/rofrol.jpg
jq '.Contents | .[] |  select( .ETag | contains("9bafaf7c87a8de7e0e62c38afb01463c"))' objects.json
```

- http://docs.aws.amazon.com/cli/latest/reference/s3api/put-object.html
- https://stackoverflow.com/questions/37527334/how-can-i-upload-to-s3-with-cli-using-server-side-encryption-with-customer-provi


## jq

length

`jq '.Contents | .[]' objects.json`

https://stackoverflow.com/questions/21334348/how-to-count-items-in-json-object-using-command-line

contains

`jq '.Contents | .[] |  select( .LastModified | contains("2017-07-28T1"))' objects.json`

https://stackoverflow.com/questions/26701538/how-to-filter-an-array-of-objects-based-on-values-in-an-inner-array-with-jq
