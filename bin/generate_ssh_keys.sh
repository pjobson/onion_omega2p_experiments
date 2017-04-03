echo "NOTE: This may generate an error if your ~/.ssh/id_rsa already exists from a previous install, because it will not overwrite your existing key."
echo "------------------------------------------"

mkdir -p ~/.ssh
dropbearkey -t rsa -f ~/.ssh/id_rsa
dropbearkey -y -f ~/.ssh/id_rsa | sed -n 2p > ~/.ssh/id_rsa.pub

