//
//  ViewController.swift
//  VolumeDebug
//
//  Created by Chen Tom on 09/11/2017.
//  Copyright © 2017 Chen Zheng. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class ViewController: UIViewController {
    
    var tickTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationManager.shareInstance.initAudioSession()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tickTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { _ in
            let timestamp = Date().timeIntervalSince1970
            DebugMananger.shareInstance.showDebugInfo("timestamp: \(timestamp)")
            DebugMananger.shareInstance.showScrollDebugInfo("timestamp: \(timestamp)")
            print("timestamp: \(timestamp)")
        })
    }


}

