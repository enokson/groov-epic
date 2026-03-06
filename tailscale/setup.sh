tailscale_dir="tailscale_1.80.0_arm";
tailscale="$tailscale_dir/tailscale";
tailscaled="$tailscale_dir/tailscaled";
tar xvf tailscale.tgz && \
    sudo mkdir -p /usr/local/bin && \
    sudo install -o root -g root -m 755 $tailscale $tailscaled /usr/local/bin && \
    cp ./tailscaled.sh /etc/init.d/tailscaled && \
    chmod +x /etc/init.d/tailscaled && \
    sudo update-rc.d tailscaled defaults && \
    sudo /etc/init.d/tailscaled start

