FROM alpine

ENV cf_email <cloudflare acount email address>
ENV cf_key <cloudflare Key>
ENV cf_id <cloudflare id of dns record to update>
ENV cf_zone <cloudflare dns zone>
ENV subdomain <subdomain name you want to be updated>

copy updateip /bin/updateip
copy zonelist /bin/zonelist
copy updateIP.conf /etc/updateIP/updateIP.conf
copy run.sh /bin/run.sh

RUN apk update && \
apk add curl bind-tools bash && \
ln -s /bin/updateip /etc/periodic/15min/updateip && \
chmod 700 /bin/updateip && \
chmod 700 /bin/zonelist && \
chmod 700 /etc/updateIP/updateIP.conf

VOLUME /etc/updateIP/

ENTRYPOINT /bin/run.sh
