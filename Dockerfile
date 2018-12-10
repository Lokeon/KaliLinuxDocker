FROM kalilinux/kali-linux-docker 
RUN apt-get update -y && apt-get upgrade -y \
    apt-get install -y nmap zenmap wireshark snort gpg mosquitto mosquitto-clients python3 python3-pip 
RUN pip3 install paho-mqtt

    
