pragma solidity ^0.8.0;


contract Donation {

    address _owner;

    mapping (address => uint256) donations;

    address[] donators;
    

    constructor (address owner) {
        _owner = owner;
    }


    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    function donation() public payable {
        require(msg.value != 0);
        if (donations[msg.sender] == 0) {
            donators.push(msg.sender);
        }
        donations[msg.sender] += msg.value;
    }

    function WithdrawDonation(address recipient, uint256 count) public onlyOwner() {
        payable(recipient).transfer(count);
    }

    function getDonatorInfo(address _donator) public view returns(uint256) {
        return donations[_donator];
    }

    function getDonators() public view returns (address[] memory) {
        return donators;
    }

}