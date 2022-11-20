pragma solidity ^0.8.7;

contract student_registry{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner);
        _;
    }

    mapping(uint=>student) public records;


    struct student{
        uint stu_id;
        string name;
        string course;
        uint marks1;
        uint marks2;
        uint marks3;
        uint totalmarks;
        uint percentage;
        bool isExist;
    }


    function register(uint id,string memory name,string memory course,uint marks1,uint marks2,uint marks3)public onlyOwner{
        require(records[id].isExist==false,"Record already exists!!");

        uint totalmarks = marks1+marks2+marks3;
        uint percentage = totalmarks*100/300;

        records[id]=student(id,name,course,marks1,marks2,marks3,totalmarks,percentage,true);

    }

    function getStudentDetails(uint studentId) public view returns(uint,string memory,string memory,uint256,uint256){
/**
*returning studentId,name,course,totalMarks and percentage of student
to corresponding key
*/
return(records[studentId].stu_id,records[studentId].name,records[studentId].course,records[studentId].totalmarks,records[studentId].percentage);
}
}

