pragma solidity ^0.8.0;

contract GeoLocationRewards {
    struct LocationCheckIn {
        uint256 timestamp;
        uint256 rewardPoints;
    }

    mapping(address => LocationCheckIn[]) private userCheckIns;
    mapping(address => uint256) private userRewards;

    function checkIn() public {
        uint256 points = 10; // Fixed reward points per check-in
        userCheckIns[msg.sender].push(LocationCheckIn({
            timestamp: block.timestamp,
            rewardPoints: points
        }));
        userRewards[msg.sender] += points;
    }

    function getRewardPoints(address _user) public view returns (uint256) {
        return userRewards[_user];
    }
}

