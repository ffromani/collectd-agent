FROM fedora:28

MAINTAINER "Francesco Romani" <fromani@redhat.com>
ENV container docker

RUN \
  dnf install -y \
    collectd collectd-virt collectd-write_prometheus && \
  dnf clean all

COPY config/collectd.conf /etc/collectd.conf

ENTRYPOINT ["/usr/sbin/collectd", "-f"]
