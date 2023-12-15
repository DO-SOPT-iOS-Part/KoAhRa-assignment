//
//  MainEntity.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/14.
//

import Foundation

// MARK: - MainEntity
struct MainEntity: Codable {
    let coord: MainCoord
    let weather: [MainWeather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: MainWind
    let clouds: MainClouds
    let dt: Int
    let sys: MainSys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - MainClouds
struct MainClouds: Codable {
    let all: Int
}

// MARK: - MainCoord
struct MainCoord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - MainSys
struct MainSys: Codable {
    let type: Int?
    let id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - MainWeather
struct MainWeather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - MainWind
struct MainWind: Codable {
    let speed: Double
    let deg: Int
}
