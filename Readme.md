

node_metrics - Метрики определенной машины
> make run-node-exporter
Open: http://127.0.0.1:9100/metrics


blackbox_metrics - Метрики по таргету (разные типы)
> make run-blackbox-exporter
Open: http://127.0.0.1:9115/metrics

- http
> http://127.0.0.1:9115/probe?module=http_slurm&target=https://app.promorepublic.com&debug=true
- icmp
> http://127.0.0.1:9115/probe?module=icmp_v4_slurm&target=app.promorepublic.com
- dns
> http://127.0.0.1:9115/probe?module=dns_slurm&target=148.251.52.110
- tcp
> http://localhost:9115/probe?module=tcp_slurm&target=148.251.52.110

Blackbox суммарная информация

http://127.0.0.1:9115/

1. По умолчанию, все проверки выполняются по IPv6. Рекомендуется изменить значение на IPv4. Для этого надо использовать директиву:  preferred_ip_protocol: ip4 в настройках каждого модуля.

2. По ссылке /metrics Blackbox Exporter отдает данные о своей работе, такие как: потребление cpu, потребление ram и т.д. Результаты проверки доступны по  url /probe.

3. Для получения подробностей по проверке в параметры запроса нужно добавить: debug=true



Краткая памятка по протоколам:
- tcp
- icmp
- dns
- tcp
- gRPC
- SMTP