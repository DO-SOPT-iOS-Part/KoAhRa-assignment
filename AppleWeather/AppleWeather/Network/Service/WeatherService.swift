//
//  WeatherService.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/14.
//

import Foundation

final class WeatherService: BaseService {
    
    static let shared = WeatherService()
    
    private override init() {}
}

extension WeatherService {
    func makeMainUrl(city: String) -> URLRequest {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=08dd40e27c122bc4aacca8b880dcbb89&units=metric"
        return WeatherService.makeRequest(urlString: urlString)
    }
    
    func makeDetailUrl(city: String) -> URLRequest {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=08dd40e27c122bc4aacca8b880dcbb89&units=metric"
        return WeatherService.makeRequest(urlString: urlString)
    }
    
    func getMainWeather(city: String) async throws -> MainEntity? {
        do {
            let request = self.makeMainUrl(city: city)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return WeatherService.parseData(data: data, modelType: MainEntity.self)
        } catch {
            throw error
        }
    }
    
    func getDetailWeather(city: String) async throws -> DetailEntity? {
        do {
            let request = self.makeDetailUrl(city: city)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return WeatherService.parseData(data: data, modelType: DetailEntity.self)
        } catch {
            throw error
        }
    }
}
