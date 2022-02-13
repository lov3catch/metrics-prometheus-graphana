reload-systemctl:
	systemctl daemon-reload
	systemctl start node_exporter
	systemctl enable node_exporter
	systemctl start blackbox_exporter
	systemctl enable blackbox_exporter

rebuild:
	docker-compose down
	docker-compose build
	docker-compose up -d
	docker-compose exec app make reload-systemctl

prom-check-config:
	docker-compose exec metric promtool check config /etc/prometheus/prometheus.yml

prom-check-rule:
	docker-compose exec metric promtool check rules /etc/prometheus/rules/example.rules.yml
	docker-compose exec metric promtool check rules /etc/prometheus/alert/example.alert.yml