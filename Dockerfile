FROM filecoin_base:0.2.2
MAINTAINER Filecoin Dev Team

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chown root:root /usr/local/bin/docker-entrypoint.sh && \
    chmod 700 /usr/local/bin/docker-entrypoint.sh

EXPOSE 6000
EXPOSE 3453

# Demon Service
ENTRYPOINT ["/sbin/tini", "-v", "/usr/local/bin/docker-entrypoint.sh"]

# RUN /usr/local/bin/docker-entrypoint.sh
