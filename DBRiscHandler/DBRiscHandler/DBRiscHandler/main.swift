//
//  main.swift
//  DBRiscHandler
//
//  Created by Matthias Kühnel on 06.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import Foundation

print("Hello, World!")

func unzipAllZips(){
    
}

func unzipEachFileAt(path: String) {
    var file: String
    
    var subFiles = FileManager.default.subpaths(atPath: path)
    
    
    for file in subFiles! {
        
//        if file.pathExtension == "zip" {
//                var fullPath = path.stringByAppendingPathComponent(file)
//        }
        
    }

}

func doSomething(){
    
//    var localEmpInvDirContent: [Any]? = try? FileManager.default.contentsOfDirectory(atPath: localDir.localEmpInvDir)
//    if localEmpInvDirContent?.count {
//        var transportManager = TransportManager(self.transportCredentials)
//        var remoteEmpInvDir: String = self.agent.transport.activeProtocol.remoteDir.remoteEmpInvDir
//        self.transportCredentials.mountedFolder = remoteEmpInvDir
//        transportManager.openConnection()
//        for file: String in localEmpInvDirContent {
//            if (file.pathExtension == "xml") {
//                DDLogVerbose("[EmpInvUploader] Founded a xml file: %@", file)
//                // Upload
//                var pathToRemoteEmpInvDir: String = URL(fileURLWithPath: self.transportCredentials.pathToMountFolder).appendingPathComponent("/").absoluteString
//                transportManager.copyFile(file.lastPathComponent, from: localDir.localEmpInvDir, to: pathToRemoteEmpInvDir, copyType: "UPLOAD")
//            }
//        }
//    }
}



