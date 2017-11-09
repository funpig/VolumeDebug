//
//  DebugMananger.swift
//  ARTreasure
//
//  Created by Chen Tom on 17/07/2017.
//  Copyright © 2017 Chen Zheng. All rights reserved.
//

import Foundation

class DebugMananger: NSObject {
    
    //-MARK: 单例
    static var shareInstance: DebugMananger{
        struct MyStatic {
            static var instance: DebugMananger = DebugMananger()
        }
        return MyStatic.instance
    }
    
    override init() {
        super.init()
        
        debugViewController = DebugViewController()
    }
    
    var debugViewController: DebugViewController?
    
    func showDebugInfo(_ info: String) {
        debugViewController?.showDebugInfo(info)
    }
    
    func showScrollDebugInfo(_ info: String) {
        debugViewController?.showScrollDebugInfo(info)
    }
}
