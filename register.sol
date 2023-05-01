// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// contract register {
//     string public 
//     mapping(string => bytes) private files; // mapping to store file contents with file name as key

//     function uploadFile(string memory fileName, bytes memory fileData) public {
//         files[fileName] = fileData; // store file data in the mapping with file name as key
//     }

//     function downloadFile(string memory fileName) public view returns (bytes memory) {
//         return files[fileName]; // retrieve file data from the mapping using file name as key
//     }
// }


contract register {
    string public os;
    string public app;
    string public version;
    // string public file;  
    bytes public file;
    string public dis;
    // string[] public data;


    struct registerpage {
        string patchname;
        string os;
        string app;
        string version;
        // string file;
        bytes file;
        string dis;
        string verificationstatus;
        string deploymentstatus;

    }

    registerpage[] public data;


    function registered(string memory _patchname ,string memory _os,
    string memory _app,
    string memory _version,
    bytes memory _file,
    string memory _dis) public {

        registerpage memory newregister = registerpage(_patchname,_os, _app, _version, _file,_dis,"Not yet sent to verification","Not yet Deployed");
        data.push(newregister);
    }
    function show() public view returns (registerpage[] memory) {
        return data;
    }


    function findandreply(string memory _patchname)  public {
        
            for(uint j=0;j<data.length;j++){
                if(keccak256(abi.encodePacked(_patchname))==keccak256(abi.encodePacked(data[j].patchname)) ){
                 
                        data[j].verificationstatus="Verified";
                      
                    
                }
            }
        
       
    }
    function findandreplynotverified(string memory _patchname) public {
        
        for(uint j=0;j<data.length;j++){
            if(keccak256(abi.encodePacked(_patchname))==keccak256(abi.encodePacked(data[j].patchname)) ){
                
             
                data[j].verificationstatus="Rejected";
                
            }
        }
        
        
    }
    function Deployed(string memory _patchname)  public {
        
        
        
        for(uint j=0;j<data.length;j++){
            if(keccak256(abi.encodePacked(_patchname))==keccak256(abi.encodePacked(data[j].patchname)) ){
            // check=true;
            data[j].deploymentstatus="Deployed";
            }
        }


        
    
       
    }
}