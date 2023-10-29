//
//  UIStackView+.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/22.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
