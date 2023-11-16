//
//  String+.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/16.
//

import Foundation

extension String {
    static func convertToHourString(from dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "HH시"
            let formattedHour = dateFormatter.string(from: date)
            return formattedHour
        } else {
            return nil
        }
    }
}
