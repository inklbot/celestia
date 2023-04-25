This Github repository has already been submitted to Celestia ITN Bonus Tasks.
<br/>
Copying and using this repository may result in penalties from Celestia ITN, and you are solely responsible for those penalties.
<br/>
So copying and submitting assignments is not a good idea and should only be used for inspiration.
<br/>

# Overview
`celestia.sh` is the celestia light node installation script.
<br/>
`node-helper.sh` is a tool script for celestia node that has its own usefulness.

# Usage

```
rm node-helper.sh
wget https://raw.githubusercontent.com/inklbot/celestia/main/node-helper.sh && sed -i 's/\r//' node-helper.sh && chmod +x node-helper.sh && sudo /bin/bash node-helper.sh
```

<img width="80%" src="https://user-images.githubusercontent.com/31788091/229275495-57c180e3-d543-4d25-944c-a2fe58fa1e01.png"/>

# Node-helper options

### 1. Install node - Install the Celestia `light` node.
  + After the installation is complete, be sure to back up your mnemonic and run the 
  + `sudo systemctl enable celestia-lightd`
  + `sudo systemctl start celestia-lightd`
  + Now view the node's logs with the `journalctl -u celestia-lightd -f` command.

### 2. Upgrade node - Upgrade Celestia-node to the most recent version.
  +

### 3. Remove node - Remove the Celestia-node.
  + Make sure to backup the `.celestia-light-blockspacerace-0/keys` folder before running this command.

### 4. Check node ID - Provides the Celestia node ID of the current server.
  + To use this command, you must have the `curl` package installed; if not, you can install it with the `apt install curl` command.

### 5. Run PayForBlob Tx - Run a PayForBlob Tx on the Celestia-node.
  + To use this command, you must have the `curl` package installed; if not, you can install it with the `apt install curl` command.
  + You must have TIA tokens in your Celestia wallet.
  
### 6. Returns the header
  + Fetch the header at the desired height.

### 7. Create new wallet
  + Create a wallet for receiving Phase 4 tasks and ITN rewards.

![image](https://user-images.githubusercontent.com/31788091/234326745-cf272eff-8798-4970-8b3c-bf247d033c71.png)

<span style="color:yellow">Do not use the wallet address and mnemonic in the screenshot above, That is just an example.</span>

