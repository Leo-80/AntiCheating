//
//  BaseInfoViewController.swift
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/10.
//  Copyright © 2017年 leo. All rights reserved.
//

import Foundation
import UIKit


class BaseInfoViewController: UIViewController {
    
    var baseInfoTextView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let baseinfoBtn = UIButton(type: .system)
        baseinfoBtn.frame = CGRect(x: 10.0, y: 70.0, width: 100, height: 30)
        baseinfoBtn.setTitle("baseinfo", for: .normal)
        baseinfoBtn.addTarget(self, action: #selector(baseinfoAction), for: .touchUpInside)
        self.view.addSubview(baseinfoBtn)
        
        baseInfoTextView = UITextView(frame: CGRect(x: 0.0, y: 120.0, width:self.view.frame.size.width, height: 400.0))
        baseInfoTextView.isEditable = true
        self.view.addSubview(baseInfoTextView)
    }
    
    
    func baseinfoAction() {
        
        let infoDictionary = Bundle.main.infoDictionary
        
        print("infoDictionary:\(String(describing: infoDictionary))")
        
//        static let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String //App 名称
//        
//        static let bundleIdentifier:String = Bundle.main.bundleIdentifier! // Bundle Identifier
//        
//        static let appVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String// App 版本号
//        
//        static let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String //Bulid 版本号
//        
        let iOSVersion:String = UIDevice.current.systemVersion //ios 版本
        print("iOSVersion:"+iOSVersion)
        let identifierNumber = UIDevice.current.identifierForVendor //设备 udid
        print("identifierNumber:\(String(describing: identifierNumber))")
        let systemName = UIDevice.current.systemName //设备名称
        print("systemName:"+systemName)
        let model = UIDevice.current.model // 设备型号
        print("model:"+model)
        let localizedModel = UIDevice.current.localizedModel
         print("localizedModel:"+localizedModel)
        let windowBoundsSize = UIScreen.main.bounds
        print("windowsize:\(String(describing: windowBoundsSize))")
        let nativeBounds = UIScreen.main.nativeBounds
        print("nativeBounds:\(String(describing: nativeBounds))")
        let scale = UIScreen.main.scale
        print("scale:\(String(describing: scale))")
        let nativeScale = UIScreen.main.nativeScale
        print("nativeScale:\(String(describing: nativeScale))")
        
        baseInfoTextView.text = "iOSVersion:"+iOSVersion+"\n identifierNumber:\(String(describing: identifierNumber))"+"\n systemName:"+systemName+"\n model:"+model+"\n localizedModel:"+localizedModel+"\n windowsize:\(String(describing: windowBoundsSize))"
        
    }
    
}
