FROM alpine

ENV cf_email <cloudflare acount email address>
ENV cf_key <cloudflare Key>
ENV cf_id <cloudflare id of dns record to update>
ENV cf_zone <cloudflare dns zone>
ENV subdomain <subdomain name you want to be updated>

copy updateip /bin/updateip
copy zonelist /bin/zonelist

RUN apk update && \
apk add curl bind-tools bash && \
ln -s /bin/updateip /etc/periodic/15min/updateip && \
echo "email=$cf_email \n key=$cf_key \n id=$cf_id \n 
zone=$cf_zone \n 
subdomain=$subdomain \n 
pidfile=/etc/updateIP/updateIP.pid \n 
IPfile=/etc/updateIP/lastIP.txt" > /etc/updateIP/updateIP.conf

VOLUME /etc/updateIP/

ENTRYPOINT ["crond","-f"]
