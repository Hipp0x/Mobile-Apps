//
//  ModelDataApi.swift
//  IOSWeatherApp
//
//  Created by Teamly Digital on 16/01/2024.
//

import Foundation

@Observable
class CurrentWeather: Decodable {
    let location: Location
    let current: Current
}

struct Location: Decodable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    let localtime: String
    
    // protocol CodingKey : chaque case represente un
    // attribut a deserialiser, et leur nom correspond a la cle
    // exacte du json. ce protocol permet 2 choses :
    
    // 1)  de respecter le camelCase (standard swift) tout en precisant
    // la vraie clé a chercher dans le json (generalement en snake_case)
    
    // 2) si on avait un "data object" dont certaines proprietes ne font
    // pas partie du json mais quon considere quand meme quon peut le
    // deserialiser, ne mettre que les clés qui sont dans le json (meme
    // chose si c'était pour sérialiser qu'une partie de l'objet)
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}

struct Current: Decodable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition?
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Double
    let pressureIn: Double
    let precipMm: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let feelsLikeC: Double
    let feelsLikeF: Double
    let visKm: Double
    let visMiles: Double
    let uv: Double
    let gustMph: Double
    let gustKph: Double
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelsLikeC = "feelslike_c"
        case feelsLikeF = "feelslike_f"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

struct Condition: Decodable {
    let text: String
    let icon: String
    let code: Int
}
