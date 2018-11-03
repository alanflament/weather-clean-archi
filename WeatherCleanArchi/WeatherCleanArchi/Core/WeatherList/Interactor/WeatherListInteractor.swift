//
//  WeatherListInteractor.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class WeatherListInteractor {
  
  // MARK: - Property

  weak var output: WeatherListInteractorOutput?
  
  // MARK: - Init
  
  init() {
    
  }
}

// MARK: - WeatherListInteractorInput

extension WeatherListInteractor: WeatherListInteractorInput {
  
  func fetchWeatherList() {
    
  }
}
