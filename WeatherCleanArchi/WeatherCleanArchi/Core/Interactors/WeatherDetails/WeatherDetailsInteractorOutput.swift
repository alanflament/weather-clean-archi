//
//  WeatherDetailsInteractorOutput.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

protocol WeatherDetailsInteractorOutput: class {
  func didFetchForecastDetails(_ forecast: Forecast)
}
