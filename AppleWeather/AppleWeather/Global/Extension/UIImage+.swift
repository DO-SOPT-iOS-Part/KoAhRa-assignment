//
//  UIImage+.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

extension UIImage {
    
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
