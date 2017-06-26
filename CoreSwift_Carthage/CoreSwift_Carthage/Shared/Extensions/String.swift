//
//  String.swift
//  UbiqApp
//
//  Created by iOS Developer on 4/11/17.
//  Copyright © 2017 ubiq. All rights reserved.
//
import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withComment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func toAny() -> AnyObject? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? AnyObject
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    public func urlPathEncoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }

}

extension Data {
    func mimeType() -> String {
        var c = [UInt32](repeating: 0, count: 1)
        (self as NSData).getBytes(&c, length: 1)
        switch (c[0]) {
        case 0xFF:
            return "image/jpeg"
        case 0x89:
            return ("image/png")
        default:
            return ""
        }
    }
}
