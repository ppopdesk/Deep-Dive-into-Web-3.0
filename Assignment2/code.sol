//SPDX-License-Identifier: Tejasvi Bajaj
pragma solidity >=0.8.0 <=0.8.15;
contract MetaCoin{
    mapping(address=>uint256) balances;
    constructor(){
        balances[tx.origin]=100000;
    }
    event transfer(address indexed from,uint256 amount, address indexed to);
    function sendCoin(address reciever,uint256 amount,address sender) public returns(bool){
        // validating if transaction is possible and executing it if possible
        if(balances[sender]<amount){
            return false;
        }
        else{
            balances[sender]-=amount;
            balances[reciever]+=amount;
            emit transfer(sender,amount,reciever);
            return true;
        }
    }
    function getBalance(address adr)public view returns(uint256){
        return balances[adr];
    }
}
contract Loan is MetaCoin{
    mapping (address=>uint256) private loans;
    event loan(uint256 _principal,address _send,uint _time);
    address private owner;
    // parent temp;
    constructor() {
        owner=msg.sender;
    }
    modifier isOwner(){
        require(msg.sender==owner);
        _;//checks if sender is owner or not
    }
    function muldiv(uint256 x,uint y,uint z) public pure returns(uint256)
    {
        //allows better computation in calculating interest
        uint256 a = x / z; uint256 b = x % z; // x = a * z + b
        uint256 c = y / z; uint256 d = y % z; // y = c * z + d
        return a * b * z + a * d + b * c + b * d / z;
    }
 
    function getCompoundInterest(uint256 principal,uint rate,uint time)public pure returns(uint256){
        //used to calculate the compound interest
        for(uint i =0;i<time;i++){
            principal=principal+muldiv(principal,rate,100);
        }
        return principal;
    }
    function reqLoan(uint256 principal,uint rate,uint time) public returns(bool){
        //a loan borrower uses this function to request the owner to settle his loan and calculates the amount
        uint256 amount=getCompoundInterest(principal,rate,time);
        if(amount>principal && loans[msg.sender]<=MetaCoin.balances[owner]){
            emit loan(principal,msg.sender,time);
            loans[msg.sender]+=amount;
            return true;
        }
        else{
            return false;
        }
    }
    function getOwnerBalance() public view returns(uint256){
        //returns the balance of owner using MetaCoin's getBalance
        return MetaCoin.getBalance(owner);
    }
    function viewDues(address temp) public view isOwner returns(uint256){
        //allows to see the balance of anyone
        return loans[temp];
    }
    function SettleDues(address taker) public isOwner returns(bool){
        //settles dues with the owner (if possible)
        if(MetaCoin.sendCoin(taker,loans[taker],owner)){
            loans[taker]=0;
            return true;
        }
        else{
            return false;
        }
    }
}

