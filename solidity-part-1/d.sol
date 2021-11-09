address owner; 

event NewScore(uint _newScore); 

constructor() { 
    owner = msg.sender; 
} 

modifier onlyOwner { 
    if(msg.sender == owner) { 
        _; 
    }
} 

function getScore() public view returns (uint) { 
    return score; 
} 
function setScore(uint _newScore) public onlyOwner { 
    score = _newScore;
    emit NewScore(score); 
}