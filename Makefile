# ** =============================================================================================
# ** docker-compose up **
# ** =============================================================================================
#
# Usage: `make services-start`
# This will create new containers for dependency services like MySQL, PHP-FMP and Nginx.
# If they already exist it will just start them.
# ------------------------------------------------------------------------------------------------
.PHONY: services-start
services-start:
	docker-compose up --no-recreate -d
# ================================================================================================



# ** =============================================================================================
# ** docker-compose stop **
# ** =============================================================================================
#
# Usage: `make services-start`
# Stop containers for dependency services. Volumes of those containers will be not deleted.
# When started again the previous state will be restored.
# ------------------------------------------------------------------------------------------------
.PHONY: services-stop
services-stop:
	docker-compose stop
# ================================================================================================



# ** =============================================================================================
# ** docker-compose build **
# ** =============================================================================================
#
# Usage: `make docker-rebuild`
# Rebuild custom Dockerfile files used in the docker-compose definition.
# ------------------------------------------------------------------------------------------------
.PHONY: docker-rebuild
docker-rebuild:
	docker-compose build
# ================================================================================================



# ** =============================================================================================
# ** docker-compose down **
# ** =============================================================================================
#
# Usage: `make services-down`
# Stop containers for dependency services. Also delete any volumes associated with them.
# The previous state will be not restored once started again.
# ------------------------------------------------------------------------------------------------
.PHONY: services-drop
services-drop:
	docker-compose down
# ================================================================================================


# ** =============================================================================================
# ** docker exec -it **
# ** =============================================================================================
#
# Usage: `make api-shell`
# Enters the php container in shell mode (fish).
# ------------------------------------------------------------------------------------------------
.PHONY: api-shell
api-shell:
	docker exec -it directus-extensions-api fish
# ================================================================================================
