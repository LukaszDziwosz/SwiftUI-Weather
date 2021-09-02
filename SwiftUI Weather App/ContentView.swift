//
//  ContentView.swift
//  SwiftUI Weather App
//
//  Created by Lukasz Dziwosz on 02/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :
                                        "cloud.sun.fill", temperature: 26)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfTheWeek: "TUE",
                                   imageName: "sun.max.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfTheWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 32)
                    WeatherDayView(dayOfTheWeek: "THU",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 22)
                    WeatherDayView(dayOfTheWeek: "FRI",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 26)
                    WeatherDayView(dayOfTheWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temperature: 28)
                  }
                
                Spacer()
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "ChangeDayTime",
                                  textColor: .blue,
                                  backgroundColor: .white)
                    }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("LightBlue")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 18){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 72, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

