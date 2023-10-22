//
//  WeatherEntity.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/18.
//

import Foundation

struct WeatherEntity {
    let location: String
    let weather: String
    let temp: Int
    let tempHigh: Int
    let tempLow: Int
    let detailWeather: [DetailWeather]
}

struct DetailWeather {
    let time: Int
    let weather: String
    let temp: Int
}

extension WeatherEntity {
    static func mainEntityDummy() -> [WeatherEntity] {
        return [
            WeatherEntity(location: "하남시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 16),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 7)
            ]),
            WeatherEntity(location: "서울시", weather: "흐림", temp: 17, tempHigh: 21, tempLow: 8, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 17),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 8)
            ]),
            WeatherEntity(location: "송파구", weather: "흐림", temp: 21, tempHigh: 29, tempLow: 15, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 21),
                DetailWeather(time: 21, weather: "cloud", temp: 21),
                DetailWeather(time: 22, weather: "lightrain", temp: 19),
                DetailWeather(time: 23, weather: "sunnyrain", temp: 19),
                DetailWeather(time: 0, weather: "thunder", temp: 18),
                DetailWeather(time: 1, weather: "sunnyrain", temp: 18),
                DetailWeather(time: 2, weather: "rain", temp: 17),
                DetailWeather(time: 3, weather: "rain", temp: 15),
                DetailWeather(time: 4, weather: "cloud", temp: 15)
            ]),
            WeatherEntity(location: "하남시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 16),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 7)
            ]),
            WeatherEntity(location: "하남시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 16),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 7)
            ])
        ]
    }
}
