//
//  DailyWeather.swift
//  DailyWeather
//
//  Created by Lukasz Dziwosz on 02/09/2021.
//

import Foundation
//will have to customize it with API

struct DailyWeather {
    var dailyWeather: [Day]
}

struct Day {
    var dayName: String
    var imageName: String
    var averageTemp: Int
}
enum imageNames: String {
    case sunnyDay =  "sun.max.fill"
    case clearNight = "moon.stars.fil"
    
}
