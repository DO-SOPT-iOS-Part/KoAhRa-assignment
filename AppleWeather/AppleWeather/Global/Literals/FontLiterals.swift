//
//  FontLiterals.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

struct FontName {
    static let SFProDisplayBold = "SF-Pro-Display-Bold"
    static let SFProDisplayLight = "SF-Pro-Display-Light"
    static let SFProDisplayMedium = "SF-Pro-Display-Medium"
    static let SFProDisplayRegular = "SF-Pro-Display-Regular"
    static let SFProDisplayThin = "SF-Pro-Display-Thin"
}

extension UIFont {
    @nonobjc class func SFProDisplayBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.SFProDisplayBold, size: size)!
    }
    
    @nonobjc class func SFProDisplayLight(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.SFProDisplayLight, size: size)!
    }
    
    @nonobjc class func SFProDisplayMedium(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.SFProDisplayMedium, size: size)!
    }
    
    @nonobjc class func SFProDisplayRegular(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.SFProDisplayRegular, size: size)!
    }
    
    @nonobjc class func SFProDisplayThin(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.SFProDisplayThin, size: size)!
    }
}
