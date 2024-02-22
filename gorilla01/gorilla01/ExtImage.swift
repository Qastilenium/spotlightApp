//
//  ExtImage.swift
//  gorilla01
//
//  Created by Ilryc Marokonen on 08.02.2024.
//

import UIKit

extension UIImage {
    public static func pixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        defer { UIGraphicsEndImageContext() }
        
        UIGraphicsBeginImageContext(pixel.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {return UIImage()}
        
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
