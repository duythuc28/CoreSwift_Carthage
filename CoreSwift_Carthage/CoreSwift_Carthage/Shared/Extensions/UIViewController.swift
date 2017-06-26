//
//  UIViewController.swift
//  UbiqApp
//
//  Created by admin on 4/25/17.
//  Copyright © 2017 ubiq. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String,
               message: String,
               cancelButtonTitle: String,
               otherButtonTitle: String? = nil,
               otherAction: PopupDialogButton.PopupDialogButtonAction? = nil)
    {
        let popup = PopupView.setup(title: title,
                                    message: message,
                                    messagePlaceholder: "",
                                    cancelTitle: cancelButtonTitle,
                                    otherButtonTitle: otherButtonTitle,
                                    otherAction: { _ in otherAction?() },
                                    popUpType: .TSNormalPopup)
        self.present(popup, animated: true, completion: nil)
    }
    
    func alertWithTextEditable(title: String,
                               message: String,
                               messagePlaceholder: String,
                               cancelButtonTitle: String,
                               otherButtonTitle: String,
                               otherAction: ((String) -> Void)? = nil)
    {
        let popup = PopupView.setup(title: title,
                                    message: message,
                                    messagePlaceholder: messagePlaceholder,
                                    cancelTitle: cancelButtonTitle,
                                    otherButtonTitle: otherButtonTitle,
                                    otherAction: { viewController in
                                        otherAction?((viewController as? TSEditablePopupViewController)?.text ?? "")
                                    },
                                    popUpType: .TSEditablePopup)
        self.present(popup, animated: true, completion: nil)
    }
}
