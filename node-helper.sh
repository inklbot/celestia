#!/bin/bash

echo ""
echo "Welcome to Celestia light node helper"
echo "1. Install node         | 4. Check node ID"
echo "2. Upgrade node(v0.9.4) | 5. Run PayForBlob transactions"
echo "3. Remove  node         | 6. Returns the header"
echo "                        | 7. Create new wallet"
echo ""

read -p "Select an option 1~7: " choice

case $choice in
  1)
    echo "Installing node..."
    if [ -f celestia.sh ]; then
      sudo rm celestia.sh
    fi    
    wget https://raw.githubusercontent.com/inklbot/celestia/main/celestia.sh 
    sed -i 's/\r//' celestia.sh
    chmod +x celestia.sh
    sudo /bin/bash celestia.sh    
    ;;
  2)
    echo "Upgrading node..."
    
    ver="1.20.3" 
    cd $HOME 
    wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz" 
    sudo rm -rf /usr/local/go 
    sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" 
    rm "go$ver.linux-amd64.tar.gz"
    
    LATEST_RELEASE=$(curl -s https://api.github.com/repos/celestiaorg/celestia-node/releases/latest | jq -r '.tag_name')
    echo "The latest Celestia Node release is: $LATEST_RELEASE"
    
    echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
    source $HOME/.bash_profile
    cd ~/celestia-node
    git fetch --tags
    git checkout $LATEST_RELEASE
    make build
    sudo make install
    sudo systemctl stop celestia-lightd
    celestia light config-update --p2p.network blockspacerace
    systemctl restart celestia-lightd
    echo ""
    echo "Node upgraded."
    echo "Node logs: journalctl -u celestia-lightd -f"
    ;;
  3)
    read -p "Do you want to remove Celestia node? (yes/no): " confirm
    if [[ $confirm != "yes" ]]; then
        echo "Remove Celestia node has been cancelled"
        exit 0
    fi    
    echo "Removing node..."
    cd $HOME
    sudo systemctl stop celestia-lightd
    sudo systemctl disable celestia-lightd
    sudo rm /etc/systemd/system/celestia-lightd.service
    sudo systemctl daemon-reload
    rm -rf $HOME/celestia-node
    rm -rf $HOME/.celestia-light-blockspacerace-0
    echo "Celestia node has been removed"
    ;;
  4)
    echo "Check node ID..."
    AUTH_TOKEN=$(celestia light auth admin --p2p.network blockspacerace)
    result=$(curl -X POST \
             -H "Authorization: Bearer $AUTH_TOKEN" \
             -H 'Content-Type: application/json' \
             -d '{"jsonrpc":"2.0","id":0,"method":"p2p.Info","params":[]}' \
             http://localhost:26658 | jq '.result')
    
    ID=$(echo "$result" | jq -r '.ID')
    echo "$result"
    echo ""
    echo "Your node ID: $ID"
    echo ""
    ;;
  5)
    echo "Run PayForBlob transactions..."
    if [ -f blob.sh ]; then
      sudo rm blob.sh
    fi

    wget https://raw.githubusercontent.com/inklbot/celestia-itn/main/blob.sh
    sed -i 's/\r//' blob.sh
    chmod +x blob.sh
    sudo /bin/bash blob.sh
    ;;
  6)  
    read -p "Enter the block height: " height
    curl -X GET "http://localhost:26659/header/$height" | jq .
    ;;
  7)
    cd ~/celestia-node
    echo "Enter wallet name:"
    read new_wallet_name
    ./cel-key add $new_wallet_name --keyring-backend test --node.type light --p2p.network blockspacerace
    ;;
  *)
    echo "Invalid option. Please select 1~7."
    ;;
esac
