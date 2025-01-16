//
//  ContentView.swift
//  Weather
//
//  Created by froehly jean-baptiste on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color.blue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text("Belfort, FR")
                    .font(.largeTitle).bold()
                    .foregroundStyle(.white)
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("2°C")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "LUN", imageName: "wind.snow", temperature: -3)
                    WeatherDayView(dayOfWeek: "MAR", imageName: "snow", temperature: -5)
                    WeatherDayView(dayOfWeek: "MER", imageName: "cloud.fill", temperature: 2)
                    WeatherDayView(dayOfWeek: "JEU", imageName: "cloud.rain.fill", temperature: 5)
                    WeatherDayView(dayOfWeek: "VEN", imageName: "cloud.sun.fill", temperature: 7)
                }
                
                Spacer()
                
                Button {
                    print("Clicked !")
                } label: {
                    Text("Change day time")
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
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.title2)
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
