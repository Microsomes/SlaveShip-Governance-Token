// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract SlaveShip {


    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;


    mapping(address => uint) lastFreeTokens;

    mapping(address => uint) lucky5;

    
    address public owner;

    uint public allocatedFreeAllowance;

    constructor(){
        owner = msg.sender;
        allocatedFreeAllowance = 1_000_000 * 8;
    }
  
    event Transfer(address indexed from, address indexed to, uint value);

    event FreeTransfer(address indexed to, uint value);

    function name() public pure returns (string memory){
        return "SlaveShip";
    }

    function symbol() public pure returns (string memory){
        return "SS";
    }

    function decimals() public pure returns (uint8) {
        return 8;
    }

    function totalSupply() public pure returns (uint256) {
        return 10 * decimals(); // 10 million tokens
    }

    function balanceOf(address _owner) public view returns (uint256 balance){
        return _balances[_owner];
    }

   
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'Insufficient balance');
        _balances[to] += value;
        _balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function freeFaucet() external returns (bool) {
        
        //ensure we even have any free token allowance left
        require(allocatedFreeAllowance >=5*8);

        //1 account can only ask for free tokens 5 times per address
        require(lastFreeTokens[msg.sender] < (5*8));

        allocatedFreeAllowance-= (5*8);
        _balances[msg.sender] += (5*8);

        emit FreeTransfer(msg.sender,(5*8));

        return true;
    } 



   


 
}