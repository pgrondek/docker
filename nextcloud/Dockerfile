FROM nextcloud:24.0.5

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        supervisor \
        smbclient && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/log/supervisord /var/run/supervisord && \
    echo "0 3 * * * php -f /var/www/html/occ app:update --all" >> /var/spool/cron/crontabs/www-data

COPY supervisord.conf /etc/supervisor/supervisord.conf

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord"]