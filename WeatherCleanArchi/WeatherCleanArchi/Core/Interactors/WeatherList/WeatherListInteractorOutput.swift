//
//  WeatherListInteractorOutput.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

protocol WeatherListInteractorOutput: class {
  func didFetchWeatherForecast(_ forecasts: [Forecast])
  func didFailToFetchWeatherForecast()
}
