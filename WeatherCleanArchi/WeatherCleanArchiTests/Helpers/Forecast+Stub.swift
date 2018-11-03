//
//  Forecast+Stub.swift
//  WeatherCleanArchiTests
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

@testable import WeatherCleanArchi

extension Forecast {
  
  static func stub(date: Date = Date(),
                   temperatureMin: Double = 10,
                   temperatureMax: Double = 10,
                   type: ForecastType = .clearSky,
                   humidity: Double = 60,
                   windDirection: Int = 80,
                   windSpeed: Double = 80) -> Forecast {
    return Forecast(date: date,
                    temperatureMin: temperatureMin,
                    temperatureMax: temperatureMax,
                    type: type,
                    humidity: humidity,
                    windDirection: windDirection,
                    windSpeed: windSpeed)
  }
}
