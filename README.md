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

<br/>
#### Options

1. Install node - Install the Celestia `light` node.
<br/>
  After the installation is complete, be sure to back up your mnemonic and run the 
  `sudo systemctl enable celestia-lightd`
  `sudo systemctl start celestia-lightd`
  Enter additional commands to run the node.
<br/>
