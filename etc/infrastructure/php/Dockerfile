FROM php:8.1.2-fpm
RUN apt-get update && apt-get install -y \
    neovim \
    wget \
    curl \
    git \
    openssl \
    libssh-dev \
    systemctl \
    supervisor 

COPY ./install/ /scripts/
RUN bash -c 'source /scripts/node_exporter.sh'
RUN bash -c 'source /scripts/blackbox_exporter.sh'

# Metrics from file
COPY ./metrics/node_exporter_custom_metric.prom /tmp/node_exporter/node_exporter_custom_metric.prom

# Node exporter
COPY ./node_exporter /etc/sysconfig/node_exporter
COPY ./sysmtemd/node_exporter.service /usr/lib/systemd/system/node_exporter.service

# Blackbox exporter
COPY ./blackbox.yml /etc/blackbox_exporter/blackbox.yml
COPY ./blackbox_exporter /etc/sysconfig/blackbox_exporter
COPY ./sysmtemd/blackbox_exporter.service /usr/lib/systemd/system/blackbox_exporter.service

WORKDIR /var/www