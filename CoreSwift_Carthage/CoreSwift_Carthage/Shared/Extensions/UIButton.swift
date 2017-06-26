//
//  UIButton.swift
//  UbiqApp
//
//  Created by iOS Developer on 4/21/17.
//  Copyright © 2017 ubiq. All rights reserved.
//

import UIKit

extension UIButton {
    @IBInspectable var preventMultiTouch: Bool {
        get {
            return false
        }
        set (isPrevent) {
            isExclusiveTouch = isPrevent
        }
    }
    
    @IBInspectable var localizeKey: String {
        
        get {
            return ""
        } set {
            self.setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
        }
    }

}
