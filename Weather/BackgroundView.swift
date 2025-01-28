//
//  BackgroundView.swift
//  Weather
//
//  Created by froehly jean-baptiste on 21/01/2025.
//

import SwiftUI

struct BackgroundView: View {
    
    var topColor: Color
    var botColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, botColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView(topColor: .blue, botColor: .white)
}
