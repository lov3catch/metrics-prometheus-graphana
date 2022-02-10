cd /tmp
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.18.0/blackbox_exporter-0.18.0.linux-amd64.tar.gz 
tar xvfz blackbox_exporter-0.18.0.linux-amd64.tar.gz
cd blackbox_exporter-0.18.0.linux-amd64
mv blackbox_exporter /usr/local/bin/