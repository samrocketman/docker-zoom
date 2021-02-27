.PHONY: docker-build docker-run clean

WEBCAM_DEVICES := $(shell /bin/sh -c '( for x in /dev/video*;do y="$$y --device $$x";done; echo $$y )')

run: docker-run

zoom-state: zoom-cache zoom-config zoom-data
zoom-cache:
	mkdir -p zoom-cache
zoom-config:
	mkdir -p zoom-config
zoom-data:
	mkdir -p zoom-data
docker-build:
	docker build -t zoom .
docker-run: docker-build zoom-state
	docker run --init -it --rm \
		-v '$(PWD)/zoom-data':/home/zoom/.zoom \
		-v '$(PWD)/zoom-config':/home/zoom/.config \
		-v '$(PWD)/zoom-cache':/home/zoom/.cache \
		--device /dev/dri \
		--device /dev/snd \
		$(WEBCAM_DEVICES) \
		-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
		zoom
clean:
	docker rmi -f zoom
	rm -rf zoom-cache zoom-data zoom-config
