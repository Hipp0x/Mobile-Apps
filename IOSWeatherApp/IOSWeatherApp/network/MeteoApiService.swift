//
//  MeteoApiService.swift
//  IOSWeatherApp
//
//  Created by Teamly Digital on 16/01/2024.
//

import Foundation
// meteoapi : instance de meteoapiservice

// meteoapiservice : "interface" avec getcurrentmeteo
// key 2f123af51ccb4ffe9b6233431241201

let BASE_URL = "https://api.weatherapi.com";

class MeteoApi {
    static let service = MeteoApiService()
    
    private init(){}
}


class MeteoApiService {
    
    // cf https://developer.apple.com/videos/play/wwdc2021/10132/
    func getCurrentMeteo(withKey key: String = "2f123af51ccb4ffe9b6233431241201", forQ q: String = "") async throws -> CurrentWeather? {
        
        // creation de la requête
        let url = URL(string: "\(BASE_URL)/v1/current.json")
        var request = URLRequest(url: url!)
        request.url?.append(queryItems: [
            URLQueryItem(name: "key", value: key),
            URLQueryItem(name: "q", value: q)
        ])
        
        print("request is \(request)")
        
        // envoi de la requête et réception de la réponse
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // conversion de la réponse si on a 200
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            // sinon on retourne null
            return nil
        }
        
        print("status is 200")
        
        var currentMeteo: CurrentWeather?
        
        // deserialisation de la réponse
        do {
             currentMeteo = try JSONDecoder().decode(CurrentWeather.self, from: data)
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        
        return currentMeteo
    }
}
