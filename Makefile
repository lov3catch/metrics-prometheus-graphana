rebuild:
	docker-compose down
	docker-compose build
	docker-compose up -d

reload-systemctl:
	systemctl daemon-reload
	systemctl start node_exporter
	systemctl enable node_exporter

run-node-exporter:
	docker-compose exec app node_exporter --collector.textfile.directory=/tmp/node_exporter

run-blackbox-exporter:
	docker-compose exec app blackbox_exporter --config.file=/etc/blackbox_exporter/blackbox.yml