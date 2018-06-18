//
//  ShowTap.swift
//  Podclipper
//
//  Created by Miguel  Saldana on 6/18/18.
//  Copyright © 2018 Miguel  Saldana. All rights reserved.
//

import Foundation
import UIKit

open class ShowTap: UIWindow,UIGestureRecognizerDelegate{
  
  fileprivate struct Constants {
    static let sharedTAP = ShowTap()
  }
  public var viewToPresentOn: UIView?
  
  public var superView: UIView?
  
  open class var sharedTap: ShowTap {
    return Constants.sharedTAP
  }
  
  open func initi(onView view: UIView? = nil) {
    let view: UIView = view ?? viewToPresentOn ?? (UIApplication.shared.delegate?.window!)!
    superView = view
    
    let gestureTap = UITapGestureRecognizer(target: self, action: #selector(self.showtap))
    view.addGestureRecognizer(gestureTap)
    gestureTap.delegate = self
    
    
    
  }
  
  @objc func showtap(){
  }
  

  override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("touchesMoved")
  }
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    //    if gestureRecognizer.state == UIGestureRecognizerState.began{
    let touches = touch.location(in: superView)
    
    let view2 = UIView()
    view2.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
    view2.layer.cornerRadius = 25
    view2.center = touches
    view2.alpha = 0.0
    view2.backgroundColor = .red
    superView?.addSubview(view2)
    
    UIView.animate(withDuration: 0.2, animations: {
      view2.alpha = 0.7
      
      view2.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }) { (complete) in
      //view2.layer.transform.scaledBy(x: 1.0, y: 1.0)
      view2.removeFromSuperview()
    }
    //    }
    
    return true
  }
  
  
}
