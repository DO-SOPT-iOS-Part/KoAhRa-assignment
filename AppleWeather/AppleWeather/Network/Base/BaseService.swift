//
//  BaseService.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/14.
//

import Foundation

class BaseService {
    static func makeRequest(urlString: String) -> URLRequest {
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    static func parseData<T: Decodable>(data: Data, modelType: T.Type) -> T? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(modelType, from: data)
            dump(result)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    static func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
