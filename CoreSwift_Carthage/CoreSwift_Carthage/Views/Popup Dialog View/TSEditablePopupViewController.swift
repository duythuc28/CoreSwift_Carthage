//
//  TSEditPopupViewController.swift
//  UbiqApp
//
//  Created by iOS developer on 5/23/17.
//  Copyright © 2017 ubiq. All rights reserved.
//

import UIKit

class TSEditablePopupViewController: UIViewController {
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var messageTextView: TextViewPlaceholder!
    
    open var alertTitle: String = ""
    open var message: String = ""
    open var messagePlaceholder: String = ""
    open var alertFont: UIFont? = UIFont.systemFont(ofSize: 17)
    open var messageFont: UIFont? = UIFont.systemFont(ofSize: 15)
    open var text: String { return messageTextView.text }
    
    init(title: String, message: String, messagePlaceholder: String) {
        super.init(nibName: "TSEditablePopupViewController", bundle: nil)
        self.alertTitle = title
        self.message = message
        self.messagePlaceholder = messagePlaceholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = alertTitle.uppercased()
        titleLabel.font = alertFont
        messageTextView.text = message
        messageTextView.placeholderLabel.text = messagePlaceholder
        messageTextView.font = messageFont
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
