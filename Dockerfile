FROM kalilinux/kali-linux-docker 
RUN set -x \ 
    && apt-get update -qqy && apt-get upgrade -qqy \
    && apt-get install -qqy gpg mosquitto mosquitto-clients nmap python3 python3-pip snort wireshark \
    && apt-get autoremove -qqy
RUN pip3 install paho-mqtt

    
