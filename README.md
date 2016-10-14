Docker - PHP 7 image
====================
A Docker PHP7 CLI image for development, based on a custom [Alpine Linux][alpine] environment with [su-exec][su-exec] integrated.
> Please see [eviweb/base-image README.md][base-image-readme] for more details

##### Health status
[![Build Status][build-status]][repository]
[![Github - Last tag][last-tag]][tags]

Usage
-----
### Simple use
Run the command `docker run --rm eviweb/php7-dev [PHP CLI options or agruments]`.    
ie. `docker run --rm eviweb/php7-dev -v` displays the current PHP version or `docker run --rm eviweb/php7-dev ./my_script.php` runs `./my_script.php`

### Change the entrypoint
Sometimes it is useful to bypass the default entrypoint, this can be done like this: `docker run --rm --entrypoint=entrypoint eviweb/php7-dev [Command]`.    
ie. `docker run --rm -ti --entrypoint=entrypoint eviweb/php7-dev bash` to enter an interactive bash session

> Please note the `--entrypoint=entrypoint` where the value `entrypoint` permits to run the command using `su-exec`

### Run as different user
By default the `php` command is run by an internal user with the default `uid=9001`.     
To run the command with a different `uid`, use the docker environment option and set the variable `LOCAL_USER_UID` with the required value.    
ie. `docker run --rm -e LOCAL_USER_UID=1000 eviweb/php7-dev -r 'echo getmyuid();'` displays the current uid using PHP.

> For more details, please refer to [Run as different user][base-image-runas]

Alpine Installed Packages
-------------------------
Please refer to [Alpine Packages][alpine-packages]

Current PHP Version
-------------------
Please refer to [PHP Version][php-version]

> Please note that Docker images are tagged with the provided PHP version

Build
-----
To build this image, run `make` from the root of this project.

License
-------
This project is licensed under the terms of the [MIT License][license]

[alpine]: https://alpinelinux.org/
[alpine-packages]: https://github.com/eviweb/php7-dev/blob/master/alpine-packages.md
[base-image-readme]: https://github.com/eviweb/base-image/blob/master/README.md
[base-image-runas]: https://github.com/eviweb/base-image/blob/master/README.md#run-as-different-user
[build-status]: https://travis-ci.org/eviweb/php7-dev.svg?branch=master
[last-tag]: https://img.shields.io/github/tag/eviweb/php7-dev.svg
[license]: https://github.com/eviweb/php7-dev/blob/master/LICENSE
[php-version]: https://github.com/eviweb/php7-dev/blob/master/php-version
[repository]: https://travis-ci.org/eviweb/php7-dev
[su-exec]: https://github.com/ncopa/su-exec
[tags]: https://github.com/eviweb/php7-dev/tags