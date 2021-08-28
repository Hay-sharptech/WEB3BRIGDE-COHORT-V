const {utils} = require('ethers')
const { checkAddressChecksum } = require('ethereum-checksum-address')
class Bank {
    constructor(address){
        this.admin = address;       
    }
    CustomerToHash=new Array()
    CanCheck = new Array();
    Customers =[];
    globalHash;
    Customer={
        name:'',
        age:'',
        address:'',
        createdAt:''
    }
 register (_name, _age, _address){
        if(!checkAddressChecksum(_address)) return 'invalid checksum'
        let hash = utils.keccak256(utils.defaultAbiCoder.encode([ "string", "address" ], [ _name, _address ]))
        this.Customer = {
            name:_name,
            age:_age,
            createdAt:Date(),
            address:_address
        }
        this.CustomerToHash[hash] = this.Customer
       // console.log('customer to hash', this.CustomerToHash[hash])
        this.globalHash  = hash;
      //  console.log('hash', hash)
 }   
 //hash=> [addresses that can view details]
  canCheck (_address, _msgSender, _customerHash){
    let customer =   this.CustomerToHash[_customerHash]
   // console.log('can check customer',customer)
    if(customer.address ===_msgSender) {
    //  this.CanCheck[_customerHash].push(_address)
    if(this.CanCheck[_customerHash] ==undefined){
        this.CanCheck[_customerHash] = [_address]
    } else {
        let c = this.CanCheck[_customerHash]
        let addr = [...c, _address]
        this.CanCheck[_customerHash] = addr
        console.log('chwcking', this.CanCheck[_customerHash] )
    }
      return 'success'  
    } else {
        return 'not authorized';
    }
  }
  checkCustomerDetails (_address, _customerHash) {
    let customer =   this.CustomerToHash[_customerHash]
    //if()
    let Cus = this.CanCheck[_customerHash];
    if(_address == this.admin ||( _address == customer.address)  ) {
            console.log('for admin and owner',customer)
        return customer;
    } else {
        if(Cus.length ==0) return 'not approved to check';
        for (let index = 0; index < Cus.length; index++) {
            if(_address == Cus[index]){
                console.log('apprived address to view', customer)
                return customer;
            } else {
                return 'not allowed'
            }
        }
    }   
    //
    }
}
const myBank = new Bank('0x03f3CDCa46ab87208f5574F88Af1CD06E5edfb9A');
myBank.register('akt', 10, '0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2')
myBank.canCheck('0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C','0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2', myBank.globalHash )
myBank.checkCustomerDetails ('0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C', myBank.globalHash)