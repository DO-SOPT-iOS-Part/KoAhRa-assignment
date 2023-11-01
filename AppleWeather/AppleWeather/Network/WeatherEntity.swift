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
    let dayWeather: [DayWeather]
}

struct DetailWeather {
    let time: Int
    let weather: String
    let temp: Int
}

struct DayWeather {
    let day: String
    let weather: String
    let rain: Int
    let lowTemp: Int
    let highTemp: Int
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
                DetailWeather(time: 4, weather: "thunder", temp: 7)], dayWeather: [
                    DayWeather(day: "오늘", weather: "sunny", rain: 0, lowTemp: 15, highTemp: 29),
                    DayWeather(day: "월", weather: "rain", rain: 60, lowTemp: 18, highTemp: 27),
                    DayWeather(day: "화", weather: "rain", rain: 60, lowTemp: 20, highTemp: 25),
                    DayWeather(day: "수", weather: "rain", rain: 70, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "목", weather: "rain", rain: 50, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "금", weather: "cloudsun", rain: 0, lowTemp: 20, highTemp: 26),
                    DayWeather(day: "토", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "일", weather: "rain", rain: 50, lowTemp: 13, highTemp: 21),
                    DayWeather(day: "월", weather: "rain", rain: 50, lowTemp: 12, highTemp: 19),
                    DayWeather(day: "화", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "수", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25)
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
                DetailWeather(time: 4, weather: "thunder", temp: 8)], dayWeather: [
                    DayWeather(day: "오늘", weather: "sunny", rain: 0, lowTemp: 15, highTemp: 29),
                    DayWeather(day: "월", weather: "rain", rain: 60, lowTemp: 18, highTemp: 27),
                    DayWeather(day: "화", weather: "rain", rain: 60, lowTemp: 20, highTemp: 25),
                    DayWeather(day: "수", weather: "rain", rain: 70, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "목", weather: "rain", rain: 50, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "금", weather: "cloudsun", rain: 0, lowTemp: 20, highTemp: 26),
                    DayWeather(day: "토", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "일", weather: "rain", rain: 50, lowTemp: 13, highTemp: 21),
                    DayWeather(day: "월", weather: "rain", rain: 50, lowTemp: 12, highTemp: 19),
                    DayWeather(day: "화", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "수", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25)
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
                DetailWeather(time: 4, weather: "cloud", temp: 15)], dayWeather: [
                    DayWeather(day: "오늘", weather: "sunny", rain: 0, lowTemp: 15, highTemp: 29),
                    DayWeather(day: "월", weather: "rain", rain: 60, lowTemp: 18, highTemp: 27),
                    DayWeather(day: "화", weather: "rain", rain: 60, lowTemp: 20, highTemp: 25),
                    DayWeather(day: "수", weather: "rain", rain: 70, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "목", weather: "rain", rain: 50, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "금", weather: "cloudsun", rain: 0, lowTemp: 20, highTemp: 26),
                    DayWeather(day: "토", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "일", weather: "rain", rain: 50, lowTemp: 13, highTemp: 21),
                    DayWeather(day: "월", weather: "rain", rain: 50, lowTemp: 12, highTemp: 19),
                    DayWeather(day: "화", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "수", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25)
                ]),
            WeatherEntity(location: "노원시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 16),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 7)], dayWeather: [
                    DayWeather(day: "오늘", weather: "sunny", rain: 0, lowTemp: 15, highTemp: 29),
                    DayWeather(day: "월", weather: "rain", rain: 60, lowTemp: 18, highTemp: 27),
                    DayWeather(day: "화", weather: "rain", rain: 60, lowTemp: 20, highTemp: 25),
                    DayWeather(day: "수", weather: "rain", rain: 70, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "목", weather: "rain", rain: 50, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "금", weather: "cloudsun", rain: 0, lowTemp: 20, highTemp: 26),
                    DayWeather(day: "토", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "일", weather: "rain", rain: 50, lowTemp: 13, highTemp: 21),
                    DayWeather(day: "월", weather: "rain", rain: 50, lowTemp: 12, highTemp: 19),
                    DayWeather(day: "화", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "수", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25)
                ]),
            WeatherEntity(location: "의정부시", weather: "흐림", temp: 16, tempHigh: 21, tempLow: 7, detailWeather: [
                DetailWeather(time: 20, weather: "rain", temp: 16),
                DetailWeather(time: 21, weather: "cloud", temp: 14),
                DetailWeather(time: 22, weather: "lightrain", temp: 12),
                DetailWeather(time: 23, weather: "thunder", temp: 12),
                DetailWeather(time: 0, weather: "sunnyrain", temp: 11),
                DetailWeather(time: 1, weather: "rain", temp: 10),
                DetailWeather(time: 2, weather: "cloud", temp: 10),
                DetailWeather(time: 3, weather: "lightrain", temp: 8),
                DetailWeather(time: 4, weather: "thunder", temp: 7)], dayWeather: [
                    DayWeather(day: "오늘", weather: "sunny", rain: 0, lowTemp: 15, highTemp: 29),
                    DayWeather(day: "월", weather: "rain", rain: 60, lowTemp: 18, highTemp: 27),
                    DayWeather(day: "화", weather: "rain", rain: 60, lowTemp: 20, highTemp: 25),
                    DayWeather(day: "수", weather: "rain", rain: 70, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "목", weather: "rain", rain: 50, lowTemp: 17, highTemp: 25),
                    DayWeather(day: "금", weather: "cloudsun", rain: 0, lowTemp: 20, highTemp: 26),
                    DayWeather(day: "토", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "일", weather: "rain", rain: 50, lowTemp: 13, highTemp: 21),
                    DayWeather(day: "월", weather: "rain", rain: 50, lowTemp: 12, highTemp: 19),
                    DayWeather(day: "화", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25),
                    DayWeather(day: "수", weather: "sunny", rain: 0, lowTemp: 18, highTemp: 25)
                ])
        ]
    }
}
