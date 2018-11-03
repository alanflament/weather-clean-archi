//
//  WeatherListInteractor.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class WeatherListInteractor {
  
  // MARK: - Constant
  
  private enum Constant {
    static let city = "Paris"
    static let units = "metric"
    static let nbDays = 16
  }
  
  // MARK: - Property

  weak var output: WeatherListInteractorOutput?
  
  private let repository: WeatherRepositoryInput
  
  // MARK: - Init
  
  init(repository: WeatherRepositoryInput) {
    self.repository = repository
  }
}

// MARK: - WeatherListInteractorInput

extension WeatherListInteractor: WeatherListInteractorInput {
  
  func fetchWeatherForecast() {
    repository.getWeatherForecast(city: Constant.city, units: Constant.units, nbDays: Constant.nbDays, success: { forecasts in
      self.output?.didFetchWeatherForecast(forecasts)
    }, failure: { error in
      self.output?.didFailToFetchWeatherForecast()
    })
  }
}
