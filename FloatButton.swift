//
//  FloatButton.swift
//  FloatViewTool
//
//  Created by sure on 2019/5/20.
//  Copyright © 2019 sure. All rights reserved.
//

import UIKit

enum FloatPositionEnum {
    case Left
    case Right
    case Top
    case Bottom
}

protocol FloatButtonProtocol {
    func floatButtonClick()
}

class FloatButton: UIButton {
    
    var baseView = UIView()
    
    var recordPosition = CGPoint()
    
    var delegate : FloatButtonProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.creatSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.creatSubViews()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func creatSubViews() {
        self.backgroundColor = UIColor.green
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        self.recordPosition = (touch?.location(in: self.baseView))!
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let currentLocation : CGPoint = (touch?.location(in: self.baseView))!
        if (currentLocation.x <= 25 || currentLocation.x > UIScreen.main.bounds.size.width - 25 || currentLocation.y <= 25 || currentLocation.y >= UIScreen.main.bounds.size.height - 25) {
            return
        }
        self.superview!.center = currentLocation
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let currentLocation : CGPoint = (touch?.location(in: self.baseView))!
        if (pow((self.recordPosition.x - currentLocation.x),2) + pow((self.recordPosition.y - currentLocation.y),2) < 1) {
            if ((self.delegate) != nil) {
                self.delegate!.floatButtonClick()
            }
        }
        self.adjustBtnPosition(CurrentPosition: currentLocation)
    }
    
    private func adjustBtnPosition(CurrentPosition currentPosition:CGPoint) {
        let leftDistance = currentPosition.x
        let rightDistance = UIScreen.main.bounds.size.width - currentPosition.x
        let topDistance = currentPosition.y
        let bottomDistance = UIScreen.main.bounds.size.height - currentPosition.y
        
        let miniDistance = leftDistance
        var director = FloatPositionEnum.Left
        
        if (rightDistance < miniDistance) {
            director = FloatPositionEnum.Right
        }else if(topDistance < miniDistance) {
            director = FloatPositionEnum.Top
        }else if(bottomDistance < miniDistance) {
            director = FloatPositionEnum.Bottom
        }
        
        switch director {
        case .Left:
            UIView.animate(withDuration: 0.25) {
                self.superview!.center = CGPoint.init(x: self.superview!.frame.size.width * 0.5, y: currentPosition.y)
            }
            break
        case .Right:
            UIView.animate(withDuration: 0.25) {
                self.superview!.center = CGPoint.init(x: UIScreen.main.bounds.size.width - self.superview!.frame.size.width * 0.5, y: currentPosition.y)
            }
            break
        case .Top:
            UIView.animate(withDuration: 0.25) {
                self.superview!.center = CGPoint.init(x: currentPosition.x, y: self.superview!.frame.size.height * 0.5)
            }
            break
        case .Bottom:
            UIView.animate(withDuration: 0.25) {
                self.superview!.center = CGPoint.init(x: currentPosition.x, y:UIScreen.main.bounds.size.height -  self.superview!.frame.size.height * 0.5)
            }
            break
        }
        
    }

}
