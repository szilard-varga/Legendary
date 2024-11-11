// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLogin {

    // Mapping to store the login status of addresses
    mapping(address => bool) public isLoggedIn;

    // Event for login
    event Login(address indexed user);

    // Event for logout
    event Logout(address indexed user);

    // Function to login (mark the address as "logged in")
    function login() public {
        require(!isLoggedIn[msg.sender], "Already logged in.");
        
        // Set the address as logged in
        isLoggedIn[msg.sender] = true;

        // Emit login event
        emit Login(msg.sender);
    }

    // Function to logout (mark the address as "logged out")
    function logout() public {
        require(isLoggedIn[msg.sender], "Not logged in.");
        
        // Set the address as logged out
        isLoggedIn[msg.sender] = false;

        // Emit logout event
        emit Logout(msg.sender);
    }

    // Function to check login status
    function checkLoginStatus(address user) public view returns (bool) {
        return isLoggedIn[user];
    }
}
