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

Grafana, where all of the dashboards are, is located at <http://localhost:3000/>.

You will need to sign in. The default credentials are:

```plain
Username: admin
Password: admin
```

You do not need to set a different password.

---

## Services & Locations

| Service Name            | Location                 | Exposed Ports            | Config Files                                                              | Usage                                                                                                                                                                                    |
| ----------------------- | ------------------------ | ------------------------ | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Grafana                 | <http://localhost:3000>  | 3000                     | telemetry-stack/grafana/grafana.ini, telemetry-stack/grafana/provisioning | Metric Dashboarding, Trace Viewing, and Automatic Alerting. This is also connected to the log stack for future monitoring of log level percentage.                                       |
| OpenTelemetry Collector | -                        | 4317, 4318               | telemetry-stack/otel-collector/otel-collector-config.yaml                 | OpenTelemetry Collector (OTelCollector) is a service that metrics and tracing can be pushed to and collected.                                                                            |
| Prometheus              | <http://localhost:9090>  | 9090                     | telemetry-stack/prometheus/prometheus.yml                                 | Prometheus collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts when specified conditions are observed. |
| Jaeger                  | <http://localhost:16686> | 6831, 16686, 14268, 4317 | telemetry-stack/jaeger/jaeger-config.yaml                                 | Jaeger measures and monitors service communication to find network bottlenecks                                                                                                           |
| Loki                    | <http://localhost:3100>  | 3100                     | telemetry-stack/loki/loki-config.yaml                                     | Loki stores all of the logs and supports log querying                                                                                                                                    |
