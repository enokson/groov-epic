if [ -z $1 ]; then
    echo "ERROR: version number not selected: eg \"1.64.2\"";
    echo "example:";
    echo "$ ./setup.sh 1.94.2";
    echo "";
    echo "You can do it!";
    exit 1;
fi
version=$1
tailscale_dir="tailscale_${version}_arm";
tailscale="$tailscale_dir/tailscale";
tailscaled="$tailscale_dir/tailscaled";
curl -L -O https://raw.githubusercontent.com/enokson/groov-epic/refs/heads/main/tailscale/tailscaled.sh &&
curl "https://pkgs.tailscale.com/stable/${tailscale_dir}.tgz" --output "${tailscale_dir}.tgz" &&
tar xvf "${tailscale_dir}.tgz" &&
cp ./tailscaled.sh /etc/init.d/tailscaled &&
sudo mkdir -p /usr/local/bin &&
sudo install -o root -g root -m 755 $tailscale $tailscaled /usr/local/bin &&
#chmod +x /etc/init.d/tailscaled &&
sudo update-rc.d tailscaled defaults &&
sudo /etc/init.d/tailscaled start &&
echo "Now, log in using a link...";
echo "\$ tailscale up";
echo "";
echo "or with a qr code...";
echo "\$ tailscale up --qr";
echo ""
echo "or with a auth-key:"
echo "\$ tailscale up --auth-key \"....\""
echo "";
echo "You can do it!";
