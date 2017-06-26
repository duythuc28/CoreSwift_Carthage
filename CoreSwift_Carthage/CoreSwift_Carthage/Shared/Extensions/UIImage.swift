//
//  File.swift
//  UbiqApp
//
//  Created by KhaiHoang on 4/28/17.
//  Copyright © 2017 ubiq. All rights reserved.
//

import UIKit
import Foundation

extension UIImage {
    func reduceCapacity(maxSize: Int = 500*1024, lenght: CGFloat = 600) -> Data? {
        var newImage = self
        
        if self.size.height > lenght || self.size.width > lenght {
            let newSize = self.size.height < self.size.width ? self.size.aspectRatioForWidth(newWidth: lenght) : self.size.aspectRatioForHeight(newHeight: lenght)
            newImage = self.resizedImageWithSize(newSize: newSize)
        }
        
        var dataImage = UIImageJPEGRepresentation(newImage, 1.0)
        
        while (dataImage?.count)! > maxSize {
            dataImage = UIImageJPEGRepresentation(newImage, 0.9)
            
            if let dataImage = dataImage, let image = UIImage(data: dataImage) {
                newImage = image
            } else {
                break
            }
        }
        
        if let dataImage = dataImage {
            return dataImage
        } else {
            return nil
        }
    }
    
    
    func resizedImageWithSize(newSize: CGSize) -> UIImage {
        let newRect = CGRect(x: 0, y: 0,width: newSize.width,height: newSize.height).integral
        var newImage: UIImage!
        
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, self.scale);
        self.draw(in: newRect)
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        let data = UIImageJPEGRepresentation(newImage, 0.7)
        return UIImage(data: data!)!
    }
}

