# Overview
`celestia.sh` is the celestia light node installation script.
<br/>
`node-helper.sh` is a tool script for celestia node that has its own usefulness.

# Usage

```
wget https://raw.githubusercontent.com/inklbot/celestia/main/node-helper.sh && sed -i 's/\r//' node-helper.sh && chmod +x node-helper.sh && sudo /bin/bash node-helper.sh
```

<img width="80%" src="https://user-images.githubusercontent.com/31788091/229257921-9f979426-7adf-44b7-999b-d068a446bc5d.png"/>
<br/>

# Node-helper options

### 1. Install node - Install the Celestia `light` node.
  + After the installation is complete, be sure to back up your mnemonic and run the 
  + `sudo systemctl enable celestia-lightd`
  + `sudo systemctl start celestia-lightd`
  + Now view the node's logs with the `journalctl -u celestia-lightd -f` command.
<br/>

## 2. Upgrade node - Upgrade Celestia-node to the most recent version.
<br/>

## 3. Remove node - Remove the Celestia-node.
<br/>

## 4. Check node ID - Provides the Celestia node ID of the current server.
  + To use this command, you must have the `curl` package installed; if not, you can install it with the `apt install curl` command.
<br/>

## 5. Run PayForBlob transactions - Run a PayForBlob transaction on the Celestia-node on the current server.
  + To use this command, you must have the `curl` package installed; if not, you can install it with the `apt install curl` command.
  + You must have TIA tokens in your Celestia wallet.
<br/>
