//
//  JailBrokenViewController.swift
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/5.
//  Copyright © 2017年 leo. All rights reserved.
//

import Foundation
import UIKit
//include "sys/stat.h"
//include "unistd.h"
//#include <sys/_types/_time_t.h>

public var jailBroben_tool_paths:[String] = ["/Applications/Cydia.app",
                                            "/Library/MobileSubstrate/MobileSubstrate.dylib",
                                            "/bin/bash",
                                            "/usr/sbin/sshd",
                                            "/etc/apt",
                                            "/Applications/blackra1n.app",
                                            "/Applications/FakeCarrier.app","/Applications/Icy.app",
                                            "/Applications/IntelliScreen.app",
                                            "/Applications/MxTube.app",
                                            "/Applications/RockApp.app",
                                            "/Applications/SBSettings.app",
                                            "/Applications/WinterBoard.app",
                                            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
                                            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
                                            "/private/var/lib/apt",
                                            "/private/var/lib/cydia",
                                            "/private/var/mobile/Library/SBSettings/Themes",
                                            "/private/var/stash","/private/var/tmp/cydia.log",
                                            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
                                            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                                            "/usr/bin/sshd",
                                            "/usr/libexec/sftp-server",];

class JailBrokenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        let jbFileBtn = UIButton(type:.system)
        jbFileBtn.frame = CGRect(x: 0.0, y: 30, width: 100, height: 30)
        jbFileBtn.setTitle("jbFileBtn", for: .normal)
        jbFileBtn.addTarget(self, action:#selector(isJailBroken_by_file), for: .touchUpInside)
        self.view.addSubview(jbFileBtn)
        
        let jbSchemeBtn = UIButton(type:.system)
        jbSchemeBtn.frame = CGRect(x: 0.0, y: 70, width: 100, height: 30)
        jbSchemeBtn.setTitle("jbSchemeBtn", for: .normal)
        jbSchemeBtn.addTarget(self, action:#selector(isJailBroken_by_scheme), for: .touchUpInside)
        self.view.addSubview(jbSchemeBtn)
        
        let jbAppPathBtn = UIButton(type:.system)
        jbAppPathBtn.frame = CGRect(x: 0.0, y: 110, width: 100, height: 30)
        jbAppPathBtn.setTitle("jbAppPathBtn", for: .normal)
        jbAppPathBtn.addTarget(self, action:#selector(isJailBroken_by_appPath), for: .touchUpInside)
        self.view.addSubview(jbAppPathBtn)
        
        let jbStatBtn = UIButton(type:.system)
        jbStatBtn.frame = CGRect(x: 0.0, y: 150, width: 100, height: 30)
        jbStatBtn.setTitle("jbStatBtn", for: .normal)
        jbStatBtn.addTarget(self, action:#selector(isJailBroken_by_stat), for: .touchUpInside)
        self.view.addSubview(jbStatBtn)
        
        let jbDYLDBtn = UIButton(type:.system)
        jbDYLDBtn.frame = CGRect(x: 0.0, y: 190, width: 100, height: 30)
        jbDYLDBtn.setTitle("jbDYLDBtn", for: .normal)
        jbDYLDBtn.addTarget(self, action:#selector(isJailBroken_by_DYLD), for: .touchUpInside)
        self.view.addSubview(jbDYLDBtn)
        
        let jbWritefileBtn = UIButton(type: .system)
        jbWritefileBtn.frame = CGRect(x: 0.0, y: 230, width: 100, height: 30)
        jbWritefileBtn.setTitle("jbWritefileBtn", for: .normal)
        jbWritefileBtn.addTarget(self, action:#selector(isJailBroken_by_writefile), for: .touchUpInside)
        self.view.addSubview(jbWritefileBtn)
        
        let jbEtcSizeBtn = UIButton(type:.system)
        jbEtcSizeBtn.frame = CGRect(x: jbFileBtn.frame.size.width+20, y: 30, width: 100, height: 30)
        jbEtcSizeBtn.setTitle("jbEtcSizeBtn", for: .normal)
        jbEtcSizeBtn.addTarget(self, action:#selector(isJailBroken_by_etcSize), for: .touchUpInside)
        self.view.addSubview(jbEtcSizeBtn)
        
        let jbSymbolicLinkBtn = UIButton(type:.system)
        jbSymbolicLinkBtn.frame = CGRect(x: jbFileBtn.frame.size.width+20, y: 70, width: 130, height: 30)
        jbSymbolicLinkBtn.setTitle("jbSymbolicLinkBtn", for: .normal)
        jbSymbolicLinkBtn.addTarget(self, action:#selector(isJailBroken_by_symbolicLink), for: .touchUpInside)
        self.view.addSubview(jbSymbolicLinkBtn)
        
        let jbDylibBtn = UIButton(type:.system)
        jbDylibBtn.frame = CGRect(x: jbFileBtn.frame.size.width+20, y: 110, width: 100, height: 30)
        jbDylibBtn.setTitle("jbDylibBtn", for: .normal)
        jbDylibBtn.addTarget(self, action:#selector(isJailBroken_by_dylib), for: .touchUpInside)
        self.view.addSubview(jbDylibBtn)
        
        let jbSystemBtn = UIButton(type:.system)
        jbSystemBtn.frame = CGRect(x: jbFileBtn.frame.size.width+20, y: 150, width: 100, height: 30)
        jbSystemBtn.setTitle("jbSystemBtn", for: .normal)
        jbSystemBtn.addTarget(self, action:#selector(isJailBroken_by_system), for: .touchUpInside)
        self.view.addSubview(jbSystemBtn)
        
        let jbOpenfileBtn = UIButton(type:.system)
        jbOpenfileBtn.frame = CGRect(x: jbFileBtn.frame.size.width+20, y: 190, width: 100, height: 30)
        jbOpenfileBtn.setTitle("jbOpenfileBtn", for: .normal)
        jbOpenfileBtn.addTarget(self, action:#selector(isJailBroken_by_openfile), for: .touchUpInside)
        self.view.addSubview(jbOpenfileBtn)
    }
  
    func isJailBroken_by_file()->Bool{
        
        print("isJailBroken_by_file")
        for toolPathStr in jailBroben_tool_paths {
            if FileManager.default.fileExists(atPath: toolPathStr) {
                
                print(toolPathStr)
                
//                return true
            }
        }
        return false
    }
    
    func isJailBroken_by_scheme()-> Bool{
        
        print("isJailBroken_by_scheme")
        
        if UIApplication.shared.canOpenURL(URL(string: "cydia://")!) {
            print("the device is jail broben")
            return true
        }
        print("the device is not jail broken")
        return false
    }
    
    func isJailBroken_by_appPath() {
        print("isJailBroken_by_appPath")
        let user_app_path = "/User/Applications/"
        
        if FileManager.default.fileExists(atPath: user_app_path) {
            print("the device is jail broken")
            let applist = FileManager.default.contents(atPath: user_app_path)
            print("applist: \(String(describing: applist))")
        }
    }
    
    func isJailBroken_by_stat() {
        print("isJailBroken_by_stat")
//        let cydia_app_path = "/Applications/Cydia.app"
        
    }
    
//    func checkinject() -> Int {
//        let ret:Int
//        let dylib_info:Dl_info
//        
//        int (*func_stat)(const char *, struct stat*) = stat()
//        
//        if ret = dladdr(func_stat, &dylib_info) && strncmp(dylib_info.dli_fname, dylib_name, strlen(dylib_name)) {
//            return 1
//        }
//        
//        return 0
//    }
    
    
    func isJailBroken_by_DYLD()->Bool {
        print("isJailBroken_by_DYLD")
        
        let env = getenv("DYLD_INSERT_LIBRARIES")
        if (env != nil) {
            return true
        }
        return false
    }
    
    func isJailBroken_by_etcSize() {
        print("isJailBroken_by_etcSize")
        
//        var s:stat? = nil
//        
//        do {
//            try stat("/etc/fstab",&s!)
//            let result = s?.st_size
//            print(result!)
//        } catch let err as NSError {
//            print(err)
//        }
    }
    
    func isJailBroken_by_symbolicLink() {
        print("isJailBroken_by_symbolicLink")
    }
    
    func isJailBroken_by_dylib() {
        print("isJailBroken_by_dylib")
    }
    
    func isJailBroken_by_system() {
        print("isJailBroken_by_system")
    }
    
    func isJailBroken_by_openfile() ->Bool{
        
        print("isJailBroken_by_openfile")
        
       let f = fopen("/Applications/Cydia.app", "r")
        
        if f != nil {
            fclose(f)
            print("the device is jail broken")
            return true
        }
        print("the device is not jail broken")
        return false
    }
    
    func isJailBroken_by_writefile() {
        print("isJailBroken_by_writefile")
        
        let stringToBeWritten = "This is a test."
        
        do {
            try stringToBeWritten.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: String.Encoding.utf8)
        } catch let err as NSError {
            print(err)
        }
        
        do {
            try FileManager.default.removeItem(atPath:"/private/jailbreak.txt")
        } catch let err as NSError {
            print(err)
        }
    }
    
}
