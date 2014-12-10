FROM tutum/ubuntu:trusty

MAINTAINER Tomohisa Kusano <siomiz@gmail.com>

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y \
	apt-transport-https \
	cgroup-bin \
	curl \
	linux-image-extra-`uname -r` \
	supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY cgroupfs_mount.sh /cgroupfs_mount.sh
RUN chmod +x /cgroupfs_mount.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY cmd.sh /cmd.sh
RUN chmod +x /cmd.sh

VOLUME ["/var/lib/docker"]

ENTRYPOINT ["/entrypoint.sh"]

# TODO: serve linked web service containers via reverse proxy
EXPOSE 22 80 2375

CMD ["/cmd.sh"]
