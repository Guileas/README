CONTAINER_USER="$(shell id -u):$(shell id -g)"

IMAGE="balthek/zola:0.13.0"

CONTAINER_NAME="README"

version:
	docker run --name ${CONTAINER_NAME} --rm -it ${IMAGE} --version

build:
	docker run --name ${CONTAINER_NAME} --rm --user ${CONTAINER_USER} -v ${PWD}:/app --workdir /app ${IMAGE} build

serve:
	docker run --name ${CONTAINER_NAME} --rm --user ${CONTAINER_USER} -v ${PWD}:/app --workdir /app -p 8111:8111 ${IMAGE} serve --interface 0.0.0.0 --port 8111 --base-url localhost

date:
	date +'%Y-%m-%dT%H:%M:%SZ' --utc