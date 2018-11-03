//
//  WeatherListPresenterInput.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol WeatherListPresenterInput {
  func viewDidLoad()
  func didTapWeatherForecast(at index: Int)
}
