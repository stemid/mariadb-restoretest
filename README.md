# Docker container for automating mariadb restore-tests

The idea is documented further on [my wiki here](https://wiki.sydit.se/teknik:guider:database:automating_restore-tests_for_mariadb_with_docker).

This repo only contains the Dockerfile and scripts required to start the container. Left out are automating scripts that run it and check the database consistency. 

Here is how you build it, in the same dir as the git repo you've cloned.

	$ sudo docker build -t restoretest .

Here is an example of how I'd run the container if I've restored MariaDB datadir to /var/database/mysql.

	$ sudo docker run -i -t -v /var/database/mysql:/var/database/mysql restoretest
