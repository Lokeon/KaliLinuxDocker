FROM kalilinux/kali-linux-docker
RUN set -x \ 
    && apt-get update -qqy && apt-get upgrade -qqy \
    && apt-get install -qqy gpg mosquitto mosquitto-clients nmap python3 python3-pip snort wireshark \
    && apt-get autoremove -qqy
RUN pip3 install paho-mqtt
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="KaliLinuxDocker" \
        org.label-schema.description="Kali Linux with some tools" \
        org.label-schema.url="https://hub.docker.com/r/lokeon/kali/" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-schema.vendor="Lokeon" \
        org.label-schema.version=$VERSION \
        org.label-schema.schema-version="1.0" \
        MANTAINER="Kevin López <kevin.lopezcala99@gmail.com>" 

    
