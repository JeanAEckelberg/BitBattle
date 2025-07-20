# BitBattle: Metrics, Trace, and Log Stacks

## Requirements

1. Ensure Docker is [installed](https://docs.docker.com/get-started/get-docker/)

    a. If using Docker on Linux as a CLI, make sure Docker is enabled and started (`systemctl enable docker` and `systemctl start docker`) post installation
    
2. Ensure your user has the appropriate permissions
    - [Linux instructions](https://stackoverflow.com/questions/48957195/how-to-fix-docker-permission-denied)
    - [Windows instructions](https://linuxbeast.com/blog/resolving-wsl-permission-denied-when-connecting-to-docker-daemon/#:~:text=If%20you%20are%20using%20Windows,access%20the%20Docker%20daemon%20socket.)

---

## Starting Everything

1. In this folder, run `sudo docker compose pull`
2. Run `sudo docker compose up -d` to start all of the containers

---

## Accessing Grafana

Grafana, where all of the dashboards are, is located [here](http://localhost:3000/).

You will need to sign in. The default credentials are:

```
Username: admin
Password: admin
```

You do not need to set a different password. 

---

## Services & Locations


Service Name | Location | Exposed Ports | Config Files | Usage 
-|-|-|-|-
Grafana | http://localhost:3000 | 3000 | metrics-stack/grafana/grafana.ini, metrics-stack/grafana/provisioning | Metric Dashboarding, Trace Viewing, and Automatic Alerting. This is also connected to the log stack for future monitoring of log level percentage.
OpenTelemetry Collector | - | 4317, 4318 | metrics-stack/otel-collector/otel-collector-config.yaml | OpenTelemetry Collector (OTelCollector) is a service that metrics and tracing can be pushed to and collected. 
Prometheus | http://localhost:9090 | 9090 | metrics-stack/prometheus/prometheus.yml | Prometheus collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts when specified conditions are observed.
Jaeger | http://localhost:16686 | 6831, 16686, 14268, 4317 |-| Jaeger measures and monitors service communication to find network bottlenecks
-|-|-|-|-
Elasticsearch | http://localhost:9200 | 9200 | log-stack/elasticsearch/config/elasticsearch.yml | A NoSQL search engine that powers quick and flexible log discovery.
Kibana | http://localhost:5601 | 5601 | log-stack/kibana/config/kibana.yml | A dashboarding frontend for viewing information in Elasticsearch.
Logstash |-| 5000, 5044 | log-stack/logstash/config/logstach.conf | Logstash takes log information from Filebeat and pipes it into Elasticsearch
Filebeat |-|-| log-stack/filebeat/filebeat.yml | Filebeat streams logfiles into Logstash 
