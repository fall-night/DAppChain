const fs = require('fs')
const path = require('path')
const contracts = path.resolve(__dirname, '../src/contracts/')
const unityAbis = path.resolve(__dirname, '../../UnityClient/UnityProject/Assets/Resources/contracts/abi')

module.exports = async function(deployer, network, accounts) {
    let builtContracts = fs.readdirSync(contracts)
    builtContracts.forEach(contract => {
        let json = JSON.parse(fs.readFileSync(path.resolve(contracts, contract)))
        let { abi } = json
        fs.writeFileSync(path.resolve(unityAbis, contract), JSON.stringify(json.abi))
    });
}