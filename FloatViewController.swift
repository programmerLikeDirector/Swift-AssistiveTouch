//
//  FloatViewController.swift
//  FloatViewTool
//
//  Created by sure on 2019/5/20.
//  Copyright © 2019 sure. All rights reserved.
//

import UIKit

class FloatViewController: UIViewController,FloatButtonProtocol {
    

    var clickCallBack : (()->())?

    func floatButtonClick() {
        if (self.clickCallBack != nil) {
            self.clickCallBack!()
        }
    }

    
    lazy var floatBtn: FloatButton = {
        return FloatButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    }()
    
    lazy var floatWindow: UIWindow = {
        var tempWindow = UIWindow()
        tempWindow.windowLevel = UIWindow.Level.alert + 1
        tempWindow.frame = CGRect.init(x: 0, y: 100, width: 50, height: 50)
        tempWindow.backgroundColor = UIColor.white
        return tempWindow
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect.zero
        // Do any additional setup after loading the view.
        
        self.floatWindow.addSubview(self.floatBtn)
        self.floatBtn.delegate = self
        self.floatWindow.makeKeyAndVisible()
    }
    
    
    
    func setFloatBaseView(baseView:UIView){
        self.floatBtn.baseView = baseView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
