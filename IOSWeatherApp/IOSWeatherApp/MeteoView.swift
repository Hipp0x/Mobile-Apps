//
//  ContentView.swift
//  IOSWeatherApp
//
//  Created by Teamly Digital on 16/01/2024.
//

import SwiftUI

struct MeteoView: View {
    @State private var currentWeather: CurrentWeather?
    @State private var ville = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("",
                      text: $ville,
                      prompt: Text("Ville").foregroundColor(.black.opacity(0.5)).font(.system(size: 20)))
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 20))
                .padding([.vertical], 40)
                .onSubmit {
                    print("submitted")
                    Task {
                        do {
                            currentWeather = try await MeteoApi.service.getCurrentMeteo(forQ: ville)
                        } catch {
                            print("Une erreur est survenue.")
                        }
                    }
                }
            
            if let currentWeather = currentWeather {
                Text("Température pour \(currentWeather.location.name)")
                    .font(.system(size: 20))
                Text("\(currentWeather.current.tempC) °C")
                    .font(.system(size: 20))
            }
            Spacer()
        }
        .padding([.horizontal], 40)
        
    }
}
