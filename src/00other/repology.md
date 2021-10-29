Get repos that have libmtp in version 1.1.19

`curl -s https://repology.org/api/v1/project/libmtp | jq -c '.[] | select( .version == "1.1.19" ) | .repo'`

To see all versions go to https://repology.org/project/libmtp/versions

- https://repology.org/api
- https://gist.github.com/ipbastola/2c955d8bf2e96f9b1077b15f995bdae3#gistcomment-2708458
- https://stackoverflow.com/questions/47421993/get-specific-key-value-pairs-with-jq/47422094#47422094
- [jq Cheet Sheet](https://gist.github.com/olih/f7437fb6962fb3ee9fe95bda8d2c8fa4)
- https://unix.stackexchange.com/questions/417128/how-can-i-find-out-in-which-distributions-a-package-is-available/675352#675352
