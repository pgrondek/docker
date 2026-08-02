FROM nextcloud:34.0.4

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        supervisor \
        smbclient && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/log/supervisord /var/run/supervisord && \
    echo "0 3 * * * php -f /var/www/html/occ app:update --all" >> /var/spool/cron/crontabs/www-data && \
    sed -i -e 's/MaxRequestWorkers       150/MaxRequestWorkers       1500/g' /etc/apache2/mods-enabled/mpm_prefork.conf

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY .htaccess /var/www/html

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord"]
