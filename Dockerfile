FROM kalilinux/kali-linux-docker 
RUN set -x  \
    && apt-get update -qqy && apt-get upgrade -qqy \
    && apt-get install -qqy nmap wireshark snort gpg mosquitto mosquitto-clients python3 python3-pip \
    && apt-autoremove -qqy
RUN pip3 install paho-mqtt

    
