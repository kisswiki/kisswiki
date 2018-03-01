`pipenv --three shell pipenv install pkg_1 pkg_ pkg_3`

Conda is more like pipenv in that it does both package management and environment/version management. And while it's true that not every python package is in conda, that vast majority are and conda and pip play nicely together if you want to use pip to install some packages.

Also conda can be used to install both surrounding tooling (like gcc and make, super useful on Windows) and, in many cases, build dependencies and necessary C libraries. Something pip doesn't handle. Doing for example "pip install gdal" will very likely leave you chasing down third party dependencies, while doing "conda install gdal" will just work.

Finally, conda has recently added R support. So you can now manage your R packages and environments with the same tools as python. Super handy if you have project that uses both R and python.

https://news.ycombinator.com/item?id=16468717