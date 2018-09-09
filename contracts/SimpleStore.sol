pragma solidity ^0.4.22;

contract SimpleStore {
    uint256 value;

    mapping(address => mapping(string => uint)) weapon_db;
    event GetTest(string _state, uint256 _rank, address _sender);
    event NewValueSet(uint256 indexed _value, address _sender);
    event NewValueSetAgain(uint256 indexed _value, address _sender);
    event StartGame(address user1, address user2);//, address user3);

    function set(uint256 _value) public {
        value = _value;
        emit NewValueSet(value, msg.sender);
    }

    function setAgain(uint256 _value) public {
        value = _value;
        emit NewValueSetAgain(value, msg.sender);
    }

    function get() public view returns (uint256, address) {
        return (value, msg.sender);
    }

    function testEvent(uint256 _blank) public {
        //emit GetTest("A", uint2str(_blank), msg.sender);
        emit GetTest("A", _blank, msg.sender);
    }

    function acquireWeapon(string _weapon) public returns (uint256){
        uint256 result = weapon_db[msg.sender][_weapon]++;
        return result;
    }

    function getWeaponList(string _weapon) public view returns (uint256){
        return weapon_db[msg.sender][_weapon];
    }

    mapping(uint256 => address) intToAddress;
    uint256 userIndex;

    function Ready(uint256 _state) public {
        intToAddress[userIndex] = msg.sender;
        userIndex++;
        if (userIndex >= 2) emit StartGame(intToAddress[0], intToAddress[1]);// , intToAddress[2]);
    }
    

    function uint2str(uint i) internal pure returns (string){
        if (i == 0) return "0";
        uint j = i;
        uint length;
        while (j != 0){
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length - 1;
        while (i != 0){
            bstr[k--] = byte(48 + i % 10);
            i /= 10;
        }
        return string(bstr);
    }

}
