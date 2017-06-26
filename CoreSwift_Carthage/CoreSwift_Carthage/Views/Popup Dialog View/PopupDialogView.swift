//
//  PopupDialogView.swift
//  TimeSheet
//
//  Created by iOS Developer on 5/6/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

enum PopupType {
    case TSEditablePopup
    case TSNormalPopup
}

//final class PopupView {
//    static func setup(title: String,
//                      message: String,
//                      messagePlaceholder: String,
//                      cancelTitle: String,
//                      otherButtonTitle: String? = nil,
//                      otherAction: ((UIViewController) -> Void)? = nil,
//                      popUpType: PopupType) -> PopupDialog
//    {
//        self.defaultPopup()
//        
//        var popupDialog: PopupDialog?
//        var viewController: UIViewController!
//        switch popUpType {
//        case .TSEditablePopup:
//            let alertViewController = TSEditablePopupViewController(title: title,
//                                                                    message: message,
//                                                                    messagePlaceholder: messagePlaceholder)
//            alertViewController.alertFont = UIFont(name: Styles.Font.bold, size: 15 * Constants.FONT_SCALE_VALUE)
//            alertViewController.messageFont = UIFont(name: Styles.Font.regular, size: 13 * Constants.FONT_SCALE_VALUE)
//            viewController = alertViewController
//            popupDialog = PopupDialog(viewController: alertViewController,
//                                      buttonAlignment: .horizontal,
//                                      transitionStyle: .fadeIn,
//                                      gestureDismissal: false)
//            
//        case .TSNormalPopup:
//            let alertViewController = TSPopupViewController(title: title, message: message)
//            alertViewController.alertFont = UIFont(name: Styles.Font.bold, size: 15 * Constants.FONT_SCALE_VALUE)
//            alertViewController.messageFont = UIFont(name: Styles.Font.regular, size: 13 * Constants.FONT_SCALE_VALUE)
//            viewController = alertViewController
//            popupDialog = PopupDialog(viewController: alertViewController,
//                                      buttonAlignment: .horizontal,
//                                      transitionStyle: .fadeIn,
//                                      gestureDismissal: false)
//        }
//        
//        let cancelButton = CancelButton(title: cancelTitle, height: 45, dismissOnTap: true, action: nil)
//        cancelButton.separatorColor = UIColor.clear
//        cancelButton.buttonColor = UIColor(hexString: Styles.Color.appBlueCyan)
//        cancelButton.titleColor = UIColor.white
//        cancelButton.titleFont = UIFont(name: Styles.Font.regular, size: 15)
//        popupDialog?.addButton(cancelButton)
//        
//        // Create second button
//        if let buttonTitle = otherButtonTitle {
//            let otherButton = DefaultButton(title: buttonTitle, height: 45, dismissOnTap: true, action: { otherAction?(viewController) })
//            otherButton.separatorColor = UIColor.clear
//            otherButton.buttonColor = UIColor(hexString: Styles.Color.appBlueCyan)
//            otherButton.leftSeparatorColor = UIColor.white
//            otherButton.needsLeftSeparator = true
//            otherButton.titleColor = UIColor.white
//            otherButton.titleFont = UIFont(name: Styles.Font.regular, size: 15)
//            popupDialog?.addButton(otherButton)
//        }
//        return popupDialog!
//    }
//    
//    fileprivate static func defaultPopup() {
//        let pcv = PopupDialogContainerView.appearance()
//        pcv.popupCornerRadius    = 0
//        let ov = PopupDialogOverlayView.appearance()
//        ov.popupOpacity     = 0.7
//        ov.color       = UIColor.black
//        ov.blurEnabled = false
//    }
//    
//}
