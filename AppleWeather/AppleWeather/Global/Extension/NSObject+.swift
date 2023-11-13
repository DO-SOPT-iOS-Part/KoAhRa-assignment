//
//  NSObject+.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/29.
//

import Foundation

extension NSObject {

    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }

}
