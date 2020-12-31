#### [trojan-go docs](https://p4gefau1t.github.io/trojan-go/basic/trojan/)

[trojan-go github](https://github.com/p4gefau1t/trojan-go)



#### server

```
.
├── cert.crt
├── geoip.dat
├── geosite.dat
├── key.key
├── server.json
├── server.yaml
├── s.yaml
├── trojan
└── trojan.service
```

```
## server.json

{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 4430,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "password"
    ],
    "ssl": {
        "cert": "/root/mzcls.com/mzcls.com.cer",
        "key": "/root/mzcls.com/mzcls.com.key",
        "sni": "v2.mzcls.com",
        "fallback_port": 443
    }
}

```

```
## trojan.service

[Unit]
Description=trojan

[Service]
ExecStart=/root/server/trojan --config /root/server/server.json
Restart=on-failure
RestartPreventExitStatus=255
Type=simple

[Install]
WantedBy=multi-user.target
```

#### client

```
## client.yaml

run-type: client
local-addr: 127.0.0.1
local-port: 1080
remote-addr: v2.mzcls.com
remote-port: 4430
password:
    - password
router:
    enabled: true
    bypass: ['geoip:cn', 'geoip:private', 'geosite:cn', 'geosite:geolocation-cn']
    block: ['geosite:category-ads']
    proxy: ['geosite:geolocation-!cn']
    default_policy: proxy
    geoip: geoip.dat
    geosite: geosite.dat
ssl:
  cert: mzcls.com/mzcls.com.cer
  key: mzcls.com/mzcls.com.key
  sni: v2.mzcls.com

```

```
## trojan.servie

[Unit]
Description=trojan

[Service]
ExecStart=/opt/trojan/trojan --config /opt/trojan/client.yaml
Restart=on-failure
RestartPreventExitStatus=255
Type=simple

[Install]
WantedBy=multi-user.target
```

