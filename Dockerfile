FROM grafana/grafana:latest

# Declare a volume for persisting Grafana data
VOLUME ["/var/lib/grafana"]

COPY grafana.ini /etc/grafana/grafana.ini

# Copy provisioning files
COPY provisioning/datasources.yaml /etc/grafana/provisioning/datasources/datasources.yaml
COPY provisioning/dashboards.yaml /etc/grafana/provisioning/dashboards/dashboards.yaml

# Run Grafana server
CMD ["grafana-server", "--allow-embedding"]

