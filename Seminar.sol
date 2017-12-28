// Steps to create the Semainar Smart contract






//Craete a dictionary of ethereum addresses to Person Strut






// method to cancel registraion. set the .active to false.
// send back 80% of the seminar fee.


pragma solidity ^0.4.0;

contract Seminar {
    //Create Strut Person that saves the 1. name, 2. age, 3, if they are attending or not.
    struct Person {
        string name;
        uint age;
        bool attending;
    }
    
    function Seminar() payable {
        
    }
    
    function () payable {
        
    }
    // other varialbes
    // seminar fee
    uint public fee;

    // loss of what they will get back if they refund.
    uint loss = 80;
    
    //Craete a dictionary of ethereum addresses to Person Strut
    mapping (address => Person) public attendees;
    
    //Create registration method that takes the name and age 
    // and ethereum address and also sets them to active.
    //There might be an error with this function becuase there is no method that pulls the fee from the account executing the function.
   
   function register(string _name, uint _age) payable {
        if(msg.value == fee) {
            attendees[msg.sender] = Person({
                name: _name,
                age: _age,
                attending: true
            });
        } else {
            revert(); 
        }
    }
    
    //create method to set registraion fee.
    function setRegistrationFee (uint _fee) {
        fee = _fee;
    }
    
    // method to cancel registraion. set the .active to false.
    // send back 80% of the seminar fee.
    function cancelRegistration() {
        attendees[msg.sender].attending = false;
        msg.sender.transfer(fee *(loss / 100 ));
    }
    
}