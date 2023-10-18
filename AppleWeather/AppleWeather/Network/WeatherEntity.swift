//
//  WeatherEntity.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/18.
//

import Foundation

struct Weather {
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

extension Weather {
    static func mainEntityDummy() -> [Weather] {
        return [
            Weather(location: "하남시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "흐림", temp: 16),
                DetailWeather(time: 21, weather: "흐림", temp: 14),
                DetailWeather(time: 22, weather: "흐림", temp: 12),
                DetailWeather(time: 23, weather: "흐림", temp: 12),
                DetailWeather(time: 0, weather: "흐림", temp: 11),
                DetailWeather(time: 1, weather: "흐림", temp: 10),
                DetailWeather(time: 2, weather: "흐림", temp: 10),
                DetailWeather(time: 3, weather: "흐림", temp: 8),
                DetailWeather(time: 4, weather: "흐림", temp: 7)
            ]),
            Weather(location: "서울시", weather: "흐림", temp: 17, tempHigh: 21, tempLow: 8, detailWeather: [
                DetailWeather(time: 20, weather: "흐림", temp: 17),
                DetailWeather(time: 21, weather: "흐림", temp: 14),
                DetailWeather(time: 22, weather: "흐림", temp: 12),
                DetailWeather(time: 23, weather: "흐림", temp: 12),
                DetailWeather(time: 0, weather: "흐림", temp: 11),
                DetailWeather(time: 1, weather: "흐림", temp: 10),
                DetailWeather(time: 2, weather: "흐림", temp: 10),
                DetailWeather(time: 3, weather: "흐림", temp: 8),
                DetailWeather(time: 4, weather: "흐림", temp: 8)
            ]),
            Weather(location: "송파구", weather: "흐림", temp: 21, tempHigh: 29, tempLow: 15, detailWeather: [
                DetailWeather(time: 20, weather: "흐림", temp: 21),
                DetailWeather(time: 21, weather: "흐림", temp: 21),
                DetailWeather(time: 22, weather: "흐림", temp: 19),
                DetailWeather(time: 23, weather: "흐림", temp: 19),
                DetailWeather(time: 0, weather: "흐림", temp: 18),
                DetailWeather(time: 1, weather: "흐림", temp: 18),
                DetailWeather(time: 2, weather: "흐림", temp: 17),
                DetailWeather(time: 3, weather: "흐림", temp: 15),
                DetailWeather(time: 4, weather: "흐림", temp: 15)
            ])
        ]
    }
}
