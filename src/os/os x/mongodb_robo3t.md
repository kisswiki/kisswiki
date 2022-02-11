## rosetta

It should be possible to run the x86_64 binaries on M1 macbooks via Rosetta 2. Is there a reason that solution isn't available for you or doesn't meet your needs?

The AVX requirement doesn't yet apply for MongoDB 5.0+ on macOS, exactly so that Rosetta 2 can continue to operate while we work on the MozJS upgrade. Once we have MozJS upgraded, we will probably restore the requirement.

https://jira.mongodb.org/browse/SERVER-42427

After installing and starting service like here https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/

`brew services list` show error when starting mongodb.

I also couldn't run `mongosh`.

I needed to install rosetta

`softwareupdate --install-rosetta`

After that service was working and mongosh also.

https://apple.stackexchange.com/questions/408375/zsh-bad-cpu-type-in-executable/408379#408379

## robo3t

`brew install --cask robo-3t`

If error "cannot be opened because the developer cannot be verified"

`Finder > Applications > Robo3t > right click (two fingers) > Open`

https://stackoverflow.com/questions/67986636/robo-3t-cannot-be-opened-because-the-developer-cannot-be-verified/71084965#71084965
