//
//  ForecastEntity.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

struct ForecastEntity: Decodable {
  
  let timestamp: Int
  let temperature: TemperatureEntity
  let pressure: Double
  let humidity: Double
  let weather: [WeatherEntity]
  let windSpeed: Double
  let windDirection: Int
  let cloudiness: Int
  
  private enum CodingKeys: String, CodingKey {
    case timestamp = "dt"
    case temperature = "temp"
    case pressure
    case humidity
    case weather
    case windSpeed = "speed"
    case windDirection = "deg"
    case cloudiness = "clouds"
  }
}
