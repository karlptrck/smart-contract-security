const ethUtil = require('ethereumjs-util');
const crypto = require('crypto');

var address = ''

while(!address.startsWith('0x1234')){
    var randomBytes = crypto.randomBytes(32)
    var publicKey = ethUtil.privateToPublic(randomBytes)
    address = ethUtil.bufferToHex(ethUtil.keccak256(publicKey).slice(-20))
    console.log(address)
}
console.log('Found : ' + address)


