contract Score {
    address owner;
    uint256 score;

    event NewScore(uint256 _newScore);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
    }

    function getScore() public view returns (uint256) {
        return score;
    }

    function setScore(uint256 _newScore) public onlyOwner {
        score = _newScore;
        emit NewScore(score);
    }
}
