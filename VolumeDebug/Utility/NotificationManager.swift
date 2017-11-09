//
//  NotificationManager.swift
//  ARKitExample
//
//  Created by Chen Tom on 10/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import CoreLocation

class NotificationManager: NSObject {
    
    var showDebug: Bool = false
    
    //-MARK: 单例
    static var shareInstance: NotificationManager{
        struct MyStatic{
            static var instance: NotificationManager = NotificationManager()
        }
        return MyStatic.instance;
    }
    
    override init() {
        super.init()
    }
    
    private let volumeNotify = NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification")
    func initAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError {
            print("\(error)")
        }
        let currentVolume = AVAudioSession.sharedInstance().outputVolume
        print("currentVolume: \(currentVolume)")
        
        //添加监听
        NotificationCenter.default.addObserver(self, selector: #selector(volumeChanged(notification:)), name: volumeNotify, object: nil)
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
    @objc private func volumeChanged(notification: Notification) {
        if notification.name == volumeNotify {
            let userInfo = notification.userInfo as! [String: AnyObject]
            print("userInfo: \(userInfo)")
            let reason = userInfo["AVSystemController_AudioVolumeChangeReasonNotificationParameter"] as? String
            if reason == "ExplicitVolumeChange" {
                if let volum: Float = userInfo["AVSystemController_AudioVolumeNotificationParameter"] as? Float {
                    print("volum: \(volum)")
                    
                    showDebug = !showDebug
                    if showDebug {
                        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
                        if let vc = DebugMananger.shareInstance.debugViewController {
                            appDelegate.window?.rootViewController?.addChildViewController(vc)
                            appDelegate.window?.rootViewController?.view.addSubview(vc.view)
                        }
                    }else {
                        DebugMananger.shareInstance.debugViewController?.view.removeFromSuperview()
                        DebugMananger.shareInstance.debugViewController?.removeFromParentViewController()
                    }
                }
            }
        }
    }
    
    func initAudioSession2() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError {
            print("\(error)")
        }
        AVAudioSession.sharedInstance().addObserver(self, forKeyPath: "outputVolume",
                                 options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume"{
            print("got in here")
        }
    }
    
}
