pragma solidity ^0.8.7;

contract Bank{


    mapping(address=> uint256) public userAccount;
    mapping(address=> bool) public userExists;


    function createacc() public payable returns(string memory){
        require(userExists[msg.sender]==false,"Account already exists");
        if(msg.value==0){
            userAccount[msg.sender]=0;
            userExists[msg.sender]=true;
            return "account created";
        }
        require(userExists[msg.sender]==false,"Account already exists");
        userAccount[msg.sender]=msg.value;
        userExists[msg.sender]=true;
        return "account created";

    }

    function deposit(uint256 amount)public payable returns(string memory){
        require(userExists[msg.sender]==true,"Account does not exists");
        userAccount[msg.sender] = userAccount[msg.sender] + amount;
        return "amount deposited successfully!";
    }

    function withdraw(uint256  amount )public payable returns (string memory){
        require(userExists[msg.sender]==true,"Account does not exist!");
        require(userAccount[msg.sender] > amount,"Insufficient funds~~");
        require(amount>0,"Enter am amount greater than zero!");
        address payable temp = payable(msg.sender);

        temp.transfer(amount);

        return "ACCOUNT withdrawn!!!";
    }

    function getBalance() public view returns (uint256) {
        return userAccount[msg.sender];
        }

    function transfer(address payable userAddress , uint amount)public returns(string memory){
        require(userExists[userAddress]==true,"Account does not exist");
        require(userExists[msg.sender]==true,"Account does not exits");
        require(userAccount[msg.sender]>amount,"Insufficient funds!");

        userAccount[msg.sender] = userAccount[msg.sender] - amount;
        userAccount[userAddress] = userAccount[userAddress] + amount;

        return "Transfer complete!!!";

    }

}
