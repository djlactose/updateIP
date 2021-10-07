FROM alpine

ENV cf_email <cloudflare acount email address>
ENV cf_key <cloudflare Key>
ENV cf_id <cloudflare id of dns record to update>
ENV cf_zone <cloudflare dns zone>
ENV subdomain <subdomain name you want to be updated>

COPY updateip /bin/updateip
COPY zonelist /bin/zonelist
COPY updateIP.conf /etc/updateIP/updateIP.conf
COPY run.sh /bin/run.sh

RUN apk update && \
apk add curl bind-tools bash && \
echo "* * * * * /bin/updateip > /dev/stdout" >> /etc/crontabs/root && \
chmod 700 /bin/updateip && \
chmod 700 /bin/zonelist && \
chmod 700 /etc/updateIP/updateIP.conf && \
chmod 700 /bin/run.sh

HEALTHCHECK CMD if [ $(ps -ef|grep /bin/run.sh|grep -v grep|grep -c ash) -gt 0 ]; then exit 0; else exit 1;fi

CMD /bin/run.sh