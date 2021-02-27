# Zoom on Linux from Docker

Learn more about [docker][docker].

# Reasoning

I don't really trust or want to grant access to my computer and files for Zoom.
Their web browser client is abysmal because you can't control different
participant views.  With Docker, I don't need to trust or worry about zoom
running in the background.  It only runs as long as the container is running.

Fortunately on Linux with X11 I can run zoom in a container and pass through
devices necessary for audio, video, webcam, and accelerated rendering.

# System details

* Host: Ubuntu 18.04
* Docker base image: Ubuntu 18.04
* Estimated size of resulting docker image: 721MB

I matched the host and image to simplify group membership for the `zoom` user
inside of the container.

# Start zoom

    make

[docker]: https://www.docker.com/
