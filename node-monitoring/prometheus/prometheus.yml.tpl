# my global config
# REF: https://github.com/PagerTree/prometheus-grafana-alertmanager-example/blob/master/prometheus/prometheus.yml
global:
  scrape_interval:     15s # By default, scrape targets every 15 seconds.
  evaluation_interval: 15s # By default, scrape targets every 15 seconds.
  # scrape_timeout is set to the global default (10s).

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  external_labels:
    monitor: 'my-project'

# Load and evaluate rules in this file every 'evaluation_interval' seconds.
rule_files:
  - "alert.rules"
  # - "first.rules"
  # - "second.rules"

# alert
#alerting:
#  alertmanagers:
#    - scheme: http
#      static_configs:
#        - targets:
#            - "alertmanager:9093"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  - job_name: node
    static_configs:
    - targets: ['node-exporter:9100']
  - job_name: 'prometheus'
  # Override the global default and scrape targets from this job every 5 seconds.
  # metrics_path defaults to '/metrics'
  # scheme defaults to 'http'.
  #
    scrape_interval: 5s
    static_configs:
    - targets: [__PROMETHEUS_TARGETS__]
