FROM alpine

copy updateip /bin/updateip
copy zonelist /bin/zonelist
copy updateIP.conf /etc/updateIP/updateIP.conf

RUN apk update && \
apk add curl bind-tools bash && \
ln -s /bin/updateip /etc/periodic/15min/updateip

VOLUME /etc/updateIP/

ENTRYPOINT ["crond","-f"]
