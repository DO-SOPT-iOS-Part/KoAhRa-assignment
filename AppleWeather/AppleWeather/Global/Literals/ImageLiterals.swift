//
//  ImageLiterals.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

enum ImageLiterals {
    enum Main {
        static var ic_more: UIImage { .load(name: "ic_more") }
        static var ic_find: UIImage { .load(name: "ic_find") }
        static var img_smallBackground: UIImage { .load(name: "img_smallbackground") }
    }
    
    enum Detail {
        static var ic_cloud: UIImage { .load(name: "ic_cloud") }
        static var ic_lightrain: UIImage { .load(name: "ic_lightrain") }
        static var ic_rain: UIImage { .load(name: "ic_rain") }
        static var ic_sunnyrain: UIImage { .load(name: "ic_sunnyrain") }
        static var ic_thunder: UIImage { .load(name: "ic_thunder") }
        static var ic_map: UIImage { .load(name: "ic_map") }
        static var ic_nav: UIImage { .load(name: "ic_nav") }
        static var ic_dot: UIImage { .load(name: "ic_dot") }
        static var ic_list: UIImage { .load(name: "ic_list") }
        static var ic_calendar: UIImage { .load(name: "ic_calendar") }
        static var img_bigBackground: UIImage { .load(name: "img_bigbackground") }
    }
}
