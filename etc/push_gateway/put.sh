#PUT запрос замещает все метрики для группы. Код ответа может быть 200 – в случае успешного обновления, и 400 – в случае ошибки.
#Если запрос выполняется с пустым body, то это приводит к удалению всех метрик для группы. При этом push_times_seconds не обновляется.
#push_times_seconds – метка времени последнего удачного POST или PUT запроса.
#push_failure_time_seconds – метка времени последнего неудачного POST или PUT запроса.

cat <<EOF | curl -X PUT http://127.0.0.1:9091/metrics/job/slurm_io_test_job/instance/monitoring.s1212.slurm.io
EOF
