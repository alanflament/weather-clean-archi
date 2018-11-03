//
//  Forecast.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

struct Forecast: Equatable {
  let date: Date
  let temperatureMin: Double
  let temperatureMax: Double
  let type: ForecastType
  let humidity: Double
  let windDirection: Int
  let windSpeed: Double
}

enum ForecastType: Equatable {
  case brokenClouds
  case clearSky
  case fewClouds
  case mist
  case rain
  case scatteredClouds
  case showerRain
  case snow
  case thunderstorm
}
