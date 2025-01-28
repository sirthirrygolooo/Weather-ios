//
//  ContentView.swift
//  Weather
//
//  Created by froehly jean-baptiste on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight: Bool = false
    
    @EnvironmentObject var forecastsVM: ForecastsViewModel
    
    
    
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .blue, botColor: .white)
            VStack{
                Spacer()
                HStack{
                    Text("Shacoville, SH")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Button {
                        forecastsVM.reloadTemperature()
                    } label : {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("22°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                HStack(spacing: 20){
                    WeatherDayView(temperature: forecastsVM.forecasts[0])
                    WeatherDayView(temperature: forecastsVM.forecasts[1])
                    WeatherDayView(temperature: forecastsVM.forecasts[2])
                    WeatherDayView(temperature: forecastsVM.forecasts[3])
                    WeatherDayView(temperature: forecastsVM.forecasts[4])
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.title2).bold()
                        .cornerRadius(12)
                }
                
                Spacer()
                
            }
        }
    }
}

struct WeatherDayView: View {
    
    var temperature: Temperature

    var body: some View {
        VStack{
            Text(temperature.dayOfWeek)
                .font(.title2)
                .foregroundStyle(.white)
            Image(systemName: temperature.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature.temp)°")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ForecastsViewModel())
}
