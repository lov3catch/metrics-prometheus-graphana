#POST запрос работает аналогично PUT, но обновляет значение только для метрик, которые присутствуют в запросе.
#Если запрос выполняется с пустым body, то push_times_seconds обновляется, а изменение ранее переданных метрик не производится.

cat <<EOF | curl -X POST --data-binary @- http://127.0.0.1:9091/metrics/job/slurm_io_test_job/instance/monitoring.s1212.slurm.io
# TYPE slurm_io_edu_counter counter
slurm_io_edu_counter{type="counter"} 42
# TYPE slurm_io_gauge gauge
slurm_io_gauge 2398.283
EOF
