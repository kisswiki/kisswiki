That's not sufficient for [reproducible builds](https://reproducible-builds.org/). Try running `docker build --no-cache` twice and compare the resulting binaries with cmp. I can practically guarantee they'll be different.

But that's exactly why you build and tag images and store in repo, pure control version at the image level.

https://www.reddit.com/r/programming/comments/8k2frh/the_sad_state_of_sysadmin_in_the_age_of_containers/dz50hg2/