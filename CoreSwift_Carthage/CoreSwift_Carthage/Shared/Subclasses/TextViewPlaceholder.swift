import UIKit

@objc protocol UBHomeViewControllerDelegate {
    func textViewDidChange(_ textView: UITextView, textSize: CGSize)
    @objc optional func textViewDidEndEditing(_ textView: UITextView)
}

class TextViewPlaceholder: UITextView, UITextViewDelegate {
    var placeholderLabel: UILabel!
    var homeDelegate: UBHomeViewControllerDelegate?
    var limitCharacters: Int = 512
    
    // Override to limit text length to 512 char
    override var text: String! {
        get {
            return super.text
        }
        set {
            var string = newValue
            if newValue.characters.count > limitCharacters {
                string = newValue.substring(to: newValue.index(text.startIndex, offsetBy: limitCharacters + 1))
            }
            super.text = string
            self.placeholderLabel.isHidden = hasText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addPlaceholder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.characters.count
        return numberOfChars <= limitCharacters
    }
    
    private func addPlaceholder() {
        placeholderLabel = UILabel(frame: CGRect(x: 5.0, y: 0.0, width: self.frame.size.width - 10.0, height: 34.0))
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.font = self.font
        self.delegate = self
        self.addSubview(placeholderLabel)
    }
    
    @IBInspectable var placeholderLocalizeKey: String {
        get {
            return ""
        } set {
            self.placeholderLabel.text = NSLocalizedString(newValue, comment: "")
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = textView.hasText
        homeDelegate?.textViewDidEndEditing?(textView)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = textView.hasText
        homeDelegate?.textViewDidChange(self, textSize: getTextSize())
    }
    
    func getTextSize() -> CGSize {
        return sizeThatFits(CGSize(width: frame.width, height: CGFloat.greatestFiniteMagnitude))
    }
}
