.PHONY: docker-build docker-run

run: docker-run

zoom-config: docker-build
	mkdir -p zoom-config

docker-build:
	docker build -t zoom .

docker-run: zoom-config
	docker run --init -it \
		-v '$(PWD)/zoom-config':/home/zoom/.zoom \
		--device /dev/dri \
		--device /dev/snd \
		--device /dev/video0 \
		-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
		zoom
