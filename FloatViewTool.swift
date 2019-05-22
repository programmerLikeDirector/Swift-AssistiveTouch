//
//  FloatViewTool.swift
//  FloatViewTool
//
//  Created by sure on 2019/5/20.
//  Copyright © 2019 sure. All rights reserved.
//

import UIKit


class FloatViewTool: NSObject {
    static let sharedTool = FloatViewTool()
    private override init() {}
    
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }
    
    lazy var floatView: FloatViewController = {
        return FloatViewController.init()
    }()
    
    func creatFloatView(OnTarget target: UIViewController, ClickCallBack callBackHandle:@escaping ()->Void){
        target.addChild(self.floatView)
        target.view.addSubview(self.floatView.view)
        self.floatView.setFloatBaseView(baseView: target.view)
        self.floatView.clickCallBack = {
            callBackHandle()
        }
    }

}
