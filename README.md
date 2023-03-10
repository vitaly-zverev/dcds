## Datascience JupyterLab RTC (DataCloud PoC)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/vitaly-zverev/dcds/HEAD)

*DockerHub: https://hub.docker.com/r/vzverev/dcds*

### Quick Start:
1) Run VPN-ready JupyterLab with  RTC mode (https://jupyterlab.readthedocs.io/en/stable/user/rtc.html):
```
 docker run -d  -p 9898:8888  --name=dcds \
 --cap-add=NET_ADMIN  \
 --device=/dev/net/tun \
 --privileged=true \
 -e DOCKER_STACKS_JUPYTER_CMD="lab --collaborative" \
 vzverev/dcds:latest
```
2) Get token:
```
docker exec dcds jupyter server list 2>&1 | grep token= | awk -Ftoken= '{print$2}' |  awk -F: '{print$1}'
or
docker logs dcds 2>&1| grep token= | awk -Ftoken= '{print$2}' | tail -1
```
2) Open URL http://${DOCKER_HOST}:9898 in browser:
```
start http://127.0.0.1:9898 (Windows)
...
open http://127.0.0.1:9898  (MacOs, Linux)
```
3) Login with token from #2. and setup required modules (pip install blabla etc):

4) Connect to VPN  ( https://gitlab.com/cpvpn/cpyvpn ):
```
docker exec -ti dcds sudo /opt/conda/bin/cp_client -m l -u username -i tun0 -s /home/jovyan/vpnc-script  vpn.portal.com
GW url(host) is: vpn.portal.com
Checking SSL mode.
SSL mode is: strict.
Please provide user name and password to authenticate
Password:
```
5) Share notebook with collaborators ( https://localtunnel.me ) :
```
npm install -g localtunnel && nohup lt --port 9898 --subdomain datacloud-rpdc-12345 &    ## Linux, MacOs
or
install node.js from https://nodejs.org/en/download/ # (Windows) 
npm install -g localtunnel # (Windows)
lt --port 9898 --subdomain datacloud-rpdc-12345 # (Windows)
```


[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/vS91_cbQ_VY/0.jpg)](https://youtu.be/vS91_cbQ_VY)
