// SPDX-License-Identifier: MIT                 // SPDX Licence Identifier
pragma solidity ^0.7.0; // Version pragma
pragma experimental ABIEncoderV2; // Experimental pragma

contract Calc {
    uint256 c;

    function add(uint256 a, uint256 b) public {
        c = a + b;
    }

    function sub(uint256 a, uint256 b) public {
        c = a - b;
    }

    function mul(uint256 a, uint256 b) public {
        c = a * b;
    }

    function div(uint256 a, uint256 b) public {
        require(b > 0, "Second argument must be different than 0");

        c = a / b;
    }

    function getResult() public view returns (uint256 x) {
        return c;
    }
}
