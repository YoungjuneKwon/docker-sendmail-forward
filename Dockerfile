FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssl sasl2-bin
ADD setup_sendmail /root/setup_sendmail
RUN chmod +x /root/setup_sendmail
ADD add_mapping /usr/local/bin/add_mapping
RUN chmod +x /usr/local/bin/add_mapping
ADD rebuild_map /usr/local/bin/rebuild_map
RUN chmod +x /usr/local/bin/rebuild_map

ENV EMAIL_MAPPINGS=''

EXPOSE 25
EXPOSE 587

CMD /root/setup_sendmail && rebuild_map && while [ 1 ];do date; sleep 60; done