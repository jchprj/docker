FROM        prom/prometheus


# ENTRYPOINT [ "sh" ]
ENTRYPOINT [ "/bin/prometheus",\
			 "--config.file=/prometheus/prometheus.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--web.console.libraries=/etc/prometheus/console_libraries", \
             "--web.console.templates=/etc/prometheus/consoles", \
             "--web.enable-lifecycle" ]