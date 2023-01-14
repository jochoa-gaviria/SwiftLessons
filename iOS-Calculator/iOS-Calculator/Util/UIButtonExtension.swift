//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Juan on 13/1/23.
//

import UIKit

extension UIButton{
    func round(){
        layer.cornerRadius = bounds.height / 2
    }
    
    func shine(){
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }

}
