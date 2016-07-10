alias ip="echo 'internal' && ifconfig | grep netmask | grep -v 127.0.0.1 | awk '{print \$2}' && echo '\nexternal' && curl api.ipify.org"
