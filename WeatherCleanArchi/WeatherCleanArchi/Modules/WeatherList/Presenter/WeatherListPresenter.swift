//
//  WeatherListPresenter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class WeatherListPresenter: Presenter {
  
  // MARK: - Property
  
  weak var output: WeatherListPresenterOutput?
  
  private let interactor: WeatherListInteractorInput
  
  // MARK: - Init
  
  init(interactor: WeatherListInteractorInput) {
    self.interactor = interactor
  }
}

// MARK: - WeatherListPresenterInput

extension WeatherListPresenter: WeatherListPresenterInput {
  
  func viewDidLoad() {
    background {
      self.interactor.fetchWeatherList()
    }
  }
}

// MARK: - WeatherListInteractorOutput

extension WeatherListPresenter: WeatherListInteractorOutput {
  
}
