//
//  WeatherDetailsInteractor.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class WeatherDetailsInteractor {
  
  // MARK: - Property
  
  weak var output: WeatherDetailsInteractorOutput?
  
  private let forecast: Forecast
  
  // MARK: - Init
  
  init(forecast: Forecast) {
    self.forecast = forecast
  }
}

// MARK: - WeatherDetailsInteractorInput

extension WeatherDetailsInteractor: WeatherDetailsInteractorInput {
  
  func fetchForecastDetails() {
    output?.didFetchForecastDetails(forecast)
  }
}
