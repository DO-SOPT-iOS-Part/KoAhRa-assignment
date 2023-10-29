//
//  UIView+.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
