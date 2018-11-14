sed -i "s:email=\"\":email=$cf_email:g" /etc/updateIP/updateIP.conf
sed -i "s:key=\"\":key=$cf_key:g" /etc/updateIP/updateIP.conf
sed -i "s:id=\"\":id=$cf_id:g" /etc/updateIP/updateIP.conf
sed -i "s:zone=\"\":zone=$cf_zone:g" /etc/updateIP/updateIP.conf
sed -i "s:subdomain=\"\":subdomain=$subdomain:g" /etc/updateIP/updateIP.conf
echo "nameserver 9.9.9.9" > /etc/resolv.conf
/bin/updateip
crond -f
