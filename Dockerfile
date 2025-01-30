# Use the official Grafana image
FROM grafana/grafana:latest

USER root

# Copy your custom grafana.ini file to the correct location
COPY custom.ini /etc/grafana/grafana.ini

# Set the environment variable to use the custom config file
ENV GF_CONFIG_FILE=/etc/grafana/grafana.ini

# Expose the Grafana port
EXPOSE 3000

# Define the volume for data persistence
VOLUME ["/var/lib/grafana"]

# Copy provisioning files
COPY provisioning/datasources.yaml /etc/grafana/provisioning/datasources/datasources.yaml
COPY provisioning/dashboards.yaml /etc/grafana/provisioning/dashboards/dashboards.yaml

# Start the Grafana server using the custom configuration
CMD ["/usr/sbin/grafana-server", "--config", "/etc/grafana/grafana.ini", "--homepath", "/usr/share/grafana"]

