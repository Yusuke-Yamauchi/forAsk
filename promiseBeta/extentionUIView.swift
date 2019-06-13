//
//  extentionUIView.swift
//  promiseBeta
//
//  Created by user on 2019/06/13.
//  Copyright © 2019 BCC. All rights reserved.
//

import UIKit

extension UIView {

    // 枠線の色
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    // 枠線のWidth
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 角丸設定
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var shadowOffset: CGSize
        {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor?
        {
        get {
            return layer.shadowColor.map
                { UIColor(cgColor: $0) }
            
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat
        {
        get {
            return layer.shadowRadius}
        set{
            layer.shadowRadius = newValue
            layer.masksToBounds = newValue > 0
        }
        
    }
    @IBInspectable var shadowOpacity: Float
        {
        get {
            return layer.shadowOpacity}
        set{
            layer.shadowOpacity = newValue
        }
    }
    

}
