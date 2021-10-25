//
//  WeatherDetailsPresenter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class WeatherDetailsPresenter: Presenter {
  
  // MARK: - Constant
  
  private enum Constant {
    static let humidityUnit = "%"
  }
  
  // MARK: - Property
  
  weak var output: WeatherDetailsPresenterOutput?
  
  private let interactor: WeatherDetailsInteractorInput
  
  // MARK: - Init
  
  init(interactor: WeatherDetailsInteractorInput) {
    self.interactor = interactor
  }
  
  // MARK: - Private
  
  private func viewModel(for forecast: Forecast) -> WeatherDetailsViewModel {
    return WeatherDetailsViewModel(date: WeatherPresenterHelper.formattedDate(for: forecast),
                                   image: WeatherPresenterHelper.image(for: forecast),
                                   temperature: WeatherPresenterHelper.formattedTemperature(for: forecast.temperatureMax),
                                   color: WeatherPresenterHelper.color(for: forecast),
                                   temperatureMin: WeatherPresenterHelper.formattedTemperature(for: forecast.temperatureMin),
                                   temperatureMax: WeatherPresenterHelper.formattedTemperature(for: forecast.temperatureMax),
                                   humidity: "\(forecast.humidity.format(f: ".0")) \(Constant.humidityUnit)",
                                   feeling: forecast.temperatureMin > 25 ? L10n.Weatherdetails.Feeling.hot : L10n.Weatherdetails.Feeling.cold)
  }
}

// MARK: - WeatherDetailsPresenterInput

extension WeatherDetailsPresenter: WeatherDetailsPresenterInput {
  
  func viewDidLoad() {
    background {
      self.interactor.fetchForecastDetails()
    }
  }
}

// MARK: - WeatherDetailsInteractorOutput

extension WeatherDetailsPresenter: WeatherDetailsInteractorOutput {
  
  func didFetchForecastDetails(_ forecast: Forecast) {
    let detailsViewModel = viewModel(for: forecast)
    main {
      self.output?.displayDetails(for: detailsViewModel)
    }
  }
}
