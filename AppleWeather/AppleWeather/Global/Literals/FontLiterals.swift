//
//  FontLiterals.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

struct FontName {
    static let SFProDisplayBold = "SFProDisplay-Bold"
    static let SFProDisplayLight = "SFProDisplay-Light"
    static let SFProDisplayMedium = "SFProDisplay-Medium"
    static let SFProDisplayRegular = "SFProDisplay-Regular"
    static let SFProDisplayThin = "SFProDisplay-Thin"
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
