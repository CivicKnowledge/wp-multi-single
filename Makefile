
#NS = wordpress
#VERSION = careerpath

#REPO = wp-dc-vol
#NAME = wp-dc-vol
INSTANCE = default
DOCKER ?= docker

# NOTE! Docker-compose gets the project name from the directory the compose file is in, 
# or the -p option, or the COMPOSE_PROJECT_NAME environmental variable. 
PROJECT_NAME=wpmultisingle

VOLUMES= \
-v $(PROJECT_NAME)_database:/var/lib/mysql \
-v $(PROJECT_NAME)_html1:/var/www/html1 \
-v $(PROJECT_NAME)_html2:/var/www/html2

.PHONY: build push shell run start stop restart reload rm rmf release enablemulti


shell:
	$(DOCKER) run --rm -i -t $(PORTS) $(VOLUMES) $(ENV) ubuntu /bin/bash

attach1:
	$(DOCKER) exec  -ti $(PROJECT_NAME)_wordpress1_1 /bin/bash

attach2:
	$(DOCKER) exec  -ti $(PROJECT_NAME)_wordpress2_1 /bin/bash



installupdraft:
	docker cp wordpress/updraftplus.zip wpdcvol_wordpress_1:/var/www/html/wp-content/plugins 

default: build