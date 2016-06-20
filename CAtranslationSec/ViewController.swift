//
//  ViewController.swift
//  CAtranslationSec
//
//  Created by apple on 16/1/21.
//  Copyright (c) 2016年 mountor_zj. All rights reserved.
//

import UIKit

/// 场景转换动画
class ViewController: UIViewController {
    
    let IMAGE1 = "01.jpg"
    let IMAGE2 = "02.jpg"
    let DURATION = 0.7
    var subtype = 0
    var imageNum = 0
    enum anumationType : Int{
        case Fade = 1                   //淡入淡出
        case Push                       //推挤
        case Reveal                    //揭开
        case MoveIn                     //覆盖
        case Cube                      //立方体
        case SuckEffect                 //吮吸
        case OglFlip                   //翻转
        case RippleEffect               //波纹
        case PageCurl                   //翻页
        case PageUnCurl                 //反翻页
        case CameraIrisHollowOpen      //开镜头
        case CameraIrisHollowClose      //关镜头
        case CurlDown                   //下翻页
        case CurlUp                     //上翻页
        case FlipFromLeft               //左翻转
        case FlipFromRight              //右翻转

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = addImage(IMAGE1).CGImage
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        var subtypeString = ""
        let numVaule = anumationType(rawValue: sender.tag)
        switch subtype{
        case 0:
            subtypeString = kCATransitionFromLeft
        case 1:
            subtypeString = kCATransitionFromBottom
        case 2:
            subtypeString = kCATransitionFromRight
        case 3:
            subtypeString = kCATransitionFromTop
        default:
            break
        }
        
        subtype = subtype > 2 ? 0 : subtype + 1
        
        switch numVaule! {
        case .Fade:
            self.transitionWithType(kCATransitionFade, subType: subtypeString, fromView: self.view)
        case .Push:
            self.transitionWithType(kCATransitionPush, subType: subtypeString, fromView: self.view)
        case .Reveal:
            self.transitionWithType(kCATransitionReveal, subType: subtypeString, fromView: self.view)
        case .MoveIn:
            self.transitionWithType(kCATransitionMoveIn, subType: subtypeString, fromView: self.view)
        case .Cube:
            self.transitionWithType("cube", subType: subtypeString, fromView: self.view)
        case .SuckEffect:
            self.transitionWithType("suckEffect", subType: subtypeString, fromView: self.view)
        case .OglFlip:
            self.transitionWithType("oglFlip", subType: subtypeString, fromView: self.view)
        case .RippleEffect:
            self.transitionWithType("rippleEffect", subType: subtypeString, fromView: self.view)
        case .PageCurl:
            self.transitionWithType("pageCurl", subType: subtypeString, fromView: self.view)
        case .PageUnCurl:
            self.transitionWithType("pageUnCurl", subType: subtypeString, fromView: self.view)
        case .CameraIrisHollowOpen:
            self.transitionWithType("cameraIrisHollowOpen", subType: subtypeString, fromView: self.view)
        case .CameraIrisHollowClose:
            self.transitionWithType("cameraIrisHollowClose", subType: subtypeString, fromView: self.view)
        case .CurlDown:
            self.animationWithView(self.view, animaTiontans: UIViewAnimationTransition.CurlDown)
        case .CurlUp:
            self.animationWithView(self.view, animaTiontans: UIViewAnimationTransition.CurlUp)
        case .FlipFromLeft:
            self.animationWithView(self.view, animaTiontans: UIViewAnimationTransition.FlipFromLeft)
        case .FlipFromRight:
            self.animationWithView(self.view, animaTiontans: UIViewAnimationTransition.FlipFromRight)
        default:
            break
        }
        let (firstImage , _) = imageNum == 0 ? (addImage(IMAGE1).CGImage ,imageNum = 1 ) : (addImage(IMAGE2).CGImage , imageNum = 0)
        self.view.layer.contents = firstImage
    }
    
    func addImage(image: String)-> UIImage{
        return UIImage(named: image)!
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 动画实现
    func transitionWithType(type: String , subType: String ,fromView view: UIView){
        /// 创建对象
        let animation = CATransition()
        /// 设置运动时间
        animation.duration = DURATION
        /// 设置运动type
        animation.type = type
        /// 设置方向
        if subType != ""{
            animation.subtype = subType
        }
        //  设置运动速度
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.layer.addAnimation(animation, forKey: "animation")
        
    }
    
    ///UIView 动画实现
    func animationWithView(View: UIView , animaTiontans: UIViewAnimationTransition){
        UIView.animateWithDuration(DURATION){
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
            UIView.setAnimationTransition(animaTiontans, forView: View, cache: true)
        }
    }


}

