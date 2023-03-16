FROM jupyter/datascience-notebook:ubuntu-20.04
USER root
RUN  apt-get update && apt-get install -y iputils-ping iputils-tracepath dnsutils iproute2 nmap telnet \
     gcc g++ libsasl2-dev libsasl2-modules \
     && pip install cpyvpn aiohttp asyncssh jupyterlab-git jupyterlab-language-pack-ru-RU sqlalchemy==2.0 pandas==1.4 psycopg[binary] \
     && npm install -g localtunnel \
     && wget https://gitlab.com/openconnect/vpnc-scripts/-/raw/master/vpnc-script && chmod +x vpnc-script \
     && passwd --delete jovyan \
     && echo "jovyan    ALL=(ALL:ALL) ALL" >> /etc/sudoers
USER jovyan
RUN  wget "https://raw.githubusercontent.com/vitaly-zverev/cpyvpn_alpine/main/Check_Services.ipynb"
RUN  wget "https://raw.githubusercontent.com/vitaly-zverev/cpyvpn_alpine/main/Check Services with beacons - template.ipynb"
