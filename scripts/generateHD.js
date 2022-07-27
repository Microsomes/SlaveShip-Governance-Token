


const Web3 = require('web3')

require("dotenv").config();

const rpcURL = "https://mainnet.infura.io/v3/"+process.env.INFURA_KEY

const web3 = new Web3(rpcURL)

const account = "0x52bc44d5378309EE2abF1539BF71dE1b7d7bE3b5"

web3.eth.getBalance(account, (err, wei) => {
    balance = web3.utils.fromWei(wei, 'ether')
    console.log(balance)
})

var acc= web3.eth.accounts.create("hello");

//get menonic seed acc
var acc = web3.eth.accounts.create("hello");
console.log(acc.address);
console.log(acc.privateKey);
console.log(acc.publicKey);
console.log(acc.mnemonic);
