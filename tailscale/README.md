# Tailscale

## Install and configure for autostart


```sh
# replace 1.94.2 with the version of tailscale that you want.
sudo curl -L https://raw.githubusercontent.com/enokson/groov-epic/refs/heads/main/tailscale/setup.sh | sudo sh -s -- 1.94.2
```

## start/stop tailscaled manually
```
sudo /etc/init.d/tailscaled start
sudo /etc/init.d/tailscale stop
```

## Login
with a link...
```
sudo tailscale up
```
or a qr code
```
sudo tailscale up --qr
```
