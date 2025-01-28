//
//  ForecastsViewModel.swift
//  Weather
//
//  Created by froehly jean-baptiste on 21/01/2025.
//

import Foundation

class ForecastsViewModel: ObservableObject {
    //modification de l'attribut en public
    @Published var forecasts: [Temperature] = []
    
    init() {
        getForecasts()
    }
    
    func getForecasts() {
        var newForecasts: [Temperature] = [
            Temperature(dayOfWeek: "MON", imageName: "cloud.sun.fill", temp: 10),
            Temperature(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 20),
            Temperature(dayOfWeek: "WED", imageName: "cloud.sun.fill", temp: 5),
            Temperature(dayOfWeek: "THU", imageName: "cloud.sun.fill", temp: 26),
            Temperature(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temp: 17)
        ]
        
        self.forecasts += newForecasts
    }
    
    func reloadTemperature() {
        for i in 0..<forecasts.count {
            forecasts[i].temp += 1
        }
    }
}
