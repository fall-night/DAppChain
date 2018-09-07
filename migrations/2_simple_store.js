const fs = require('fs')
const path = require('path')

var SimpleStore = artifacts.require("./SimpleStore.sol");

const unityAddresses = path.resolve(__dirname, '../../UnityClient/UnityProject/Assets/Resources/contracts/address')

module.exports = function(deployer) {
  deployer.deploy(SimpleStore).then(() => {
    fs.writeFileSync(path.resolve(unityAddresses, "SimpleStore.txt"), SimpleStore.address)
  });
};