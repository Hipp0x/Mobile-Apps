//
//  IOSWeatherAppApp.swift
//  IOSWeatherApp
//
//  Created by Teamly Digital on 16/01/2024.
//

import SwiftUI

@main
struct IOSWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            MeteoView()
                .background(.purple.opacity(0.4))
        }
    }
}
