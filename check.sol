//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;





contract report {

    // string public applicationname;
    // string public applicationversion;
    // string public discription;
    // string public date;
    // string[] public data;

    struct reportpage {
        string os;
        string app;
        string ver;
        string dis;
        uint256 lablestatus;
        uint256 selectionstatus ;
    }

    // mapping (string => reportpage) public reportdetails;


    reportpage[] public AllArray;
    reportpage[] public AllArray1;
    




    function submit(string memory _os,
    string memory _app,
    string memory _ver,
    string memory _dis) public {
        // reportdetails[_applicationname] = reportpage(_applicationversion,_discription,_date);
        // data.push(reportdetails[_applicationname] = reportpage(_applicationversion,_discription,_date));
        // data.push(reportdetails[_applicationname]);

        reportpage memory newreport = reportpage(_os, _app, _ver, _dis,0,0);

        AllArray.push(newreport);
    }
    function verify() public view returns(reportpage[] memory) {
        return AllArray;
    }

    function labler(string[] memory _discription,uint256[] memory _lablestatus) public {
        for(uint256 i=0;i<AllArray.length;i++)
        {
            for(uint256 j=0;j<_discription.length;j++){

            if(keccak256(abi.encodePacked(_discription[j])) == keccak256(abi.encodePacked(AllArray[i].dis)))
            {
                AllArray[i].lablestatus=_lablestatus[j];
            }
            }
        }
    }
    function adminselect(string[] memory _discription) public {
        for(uint256 i=0;i<AllArray.length;i++)
        {
            for(uint256 j=0;j<_discription.length;j++){

            if(keccak256(abi.encodePacked(_discription[j])) == keccak256(abi.encodePacked(AllArray[i].dis)))
            {
                AllArray[i].selectionstatus=1;
            }
            }
        }
    }

}