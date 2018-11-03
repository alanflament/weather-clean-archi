//
//  WeatherListPresenter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherListPresenter: Presenter {
  
  // MARK: - Property
  
  weak var output: WeatherListPresenterOutput?
  
  private let interactor: WeatherListInteractorInput
  private let router: WeatherRouter
  
  // MARK: - Init
  
  init(interactor: WeatherListInteractorInput, router: WeatherRouter) {
    self.interactor = interactor
    self.router = router
  }
  
  // MARK: - Private
  
  private func viewModel(for forecast: Forecast, at index: Int) -> ForecastItemViewModel {
    return ForecastItemViewModel(date: WeatherPresenterHelper.formattedDate(for: forecast),
                                 image: WeatherPresenterHelper.image(for: forecast),
                                 temperature: WeatherPresenterHelper.formattedTemperature(for: forecast.temperatureMax),
                                 color: WeatherPresenterHelper.color(for: forecast))
  }
}

// MARK: - WeatherListPresenterInput

extension WeatherListPresenter: WeatherListPresenterInput {
  
  func viewDidLoad() {
    background {
      self.interactor.fetchWeatherForecast()
    }
  }
  
  func didTapWeatherForecast(at index: Int) {
    background {
      self.interactor.getWeatherForecastForDetails(at: index)
    }
  }
}

// MARK: - WeatherListInteractorOutput

extension WeatherListPresenter: WeatherListInteractorOutput {

  func didFetchWeatherForecast(_ forecasts: [Forecast]) {
    var forecastViewModels: [ForecastItemViewModel] = []
    for (index, element) in forecasts.enumerated() {
      forecastViewModels.append(viewModel(for: element, at: index))
    }
    main {
      self.output?.displayWeatherForecastList(forecastViewModels)
    }
  }
  
  func didFailToFetchWeatherForecast() {
    main {
      self.output?.displayWeatherForecastLoadingError()
    }
  }
  
  func didGetWeatherForecastForDetails(_ forecast: Forecast) {
    main {
      self.router.routeTo(route: .weatherDetails(forecast: forecast))
    }
  }
}
