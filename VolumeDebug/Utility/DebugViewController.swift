//
//  DebugViewController.swift
//  ARTreasure
//
//  Created by Chen Tom on 14/07/2017.
//  Copyright © 2017 Chen Zheng. All rights reserved.
//

import Foundation
import UIKit

class DebugViewController: UIViewController {
    
//    static func initWithStoryBoard() -> UIViewController {
//        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: DebugViewController.self))
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clear
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        let top0: NSLayoutConstraint = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.top, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.top, multiplier:1.0, constant: 0)
        
        let bottom0: NSLayoutConstraint = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.bottom, multiplier:1.0, constant: 0)
        
        let left0: NSLayoutConstraint = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.left, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.left, multiplier:1.0, constant: 0)
        
        let right0: NSLayoutConstraint = NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:self.view, attribute:NSLayoutAttribute.right, multiplier:1.0, constant: 0)
        
        self.view.addConstraint(top0)
        self.view.addConstraint(left0)
        self.view.addConstraint(bottom0)
        self.view.addConstraint(right0)
        
        debugLabel.backgroundColor = UIColor.clear
        debugLabel.numberOfLines = 2
        debugTextView.backgroundColor = UIColor.clear
        debugTextView.inputView?.backgroundColor = UIColor.clear
        
        let margin: CGFloat = 20.0
        
        blurEffectView.contentView.addSubview(debugLabel)
        blurEffectView.contentView.addSubview(debugTextView)
        debugLabel.translatesAutoresizingMaskIntoConstraints = false
        debugTextView.translatesAutoresizingMaskIntoConstraints = false
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: debugLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 0.0, constant: 100)
        //上边约束
        let top: NSLayoutConstraint = NSLayoutConstraint(item: debugLabel, attribute: NSLayoutAttribute.top, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.top, multiplier:1.0, constant: margin)
        //左边约束
        let left: NSLayoutConstraint = NSLayoutConstraint(item: debugLabel, attribute: NSLayoutAttribute.left, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.left, multiplier:1.0, constant: margin)
        //右边约束
        let right: NSLayoutConstraint = NSLayoutConstraint(item: debugLabel, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.right, multiplier:1.0, constant: -margin)
        
        blurEffectView.addConstraint(top)
        blurEffectView.addConstraint(left)//父控件添加约束
        blurEffectView.addConstraint(right)//父控件添加约束
        debugLabel.addConstraint(height)
        
        
        
        let top2: NSLayoutConstraint = NSLayoutConstraint(item: debugTextView, attribute: NSLayoutAttribute.top, relatedBy:NSLayoutRelation.equal, toItem:debugLabel, attribute:NSLayoutAttribute.bottom, multiplier:1.0, constant: 0)
        
        let bottom2: NSLayoutConstraint = NSLayoutConstraint(item: debugTextView, attribute: NSLayoutAttribute.bottom, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.bottom, multiplier:1.0, constant: -3*margin)
        
        let left2: NSLayoutConstraint = NSLayoutConstraint(item: debugTextView, attribute: NSLayoutAttribute.left, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.left, multiplier:1.0, constant: margin)

        let right2: NSLayoutConstraint = NSLayoutConstraint(item: debugTextView, attribute: NSLayoutAttribute.right, relatedBy:NSLayoutRelation.equal, toItem:blurEffectView, attribute:NSLayoutAttribute.right, multiplier:1.0, constant: -margin)
        
        blurEffectView.addConstraint(top2)
        blurEffectView.addConstraint(left2)
        blurEffectView.addConstraint(bottom2)
        blurEffectView.addConstraint(right2)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    private var debugLabel: UILabel = UILabel()
    private var debugTextView: UITextView = UITextView()
    
    func showDebugInfo(_ info: String) {
        debugLabel.text = info
    }
    
    func showScrollDebugInfo(_ info: String) {
        var str = ""
        if let text = debugTextView.text, text.isEmpty {
            str = "[DEBUG]" + info
        }else {
            str = "\n[DEBUG]" + info
        }
        debugTextView.insertText(str)
    }
}
