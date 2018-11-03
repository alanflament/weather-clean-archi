//
//  WeatherListPresenter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherListPresenter: Presenter {
  
  // MARK: - Constant
  
  private enum Constant {
    static let dateFormat = "MMMM d, yyyy"
    static let temperatureUnit = "°C"
  }
  
  // MARK: - Property
  
  weak var output: WeatherListPresenterOutput?
  
  private let interactor: WeatherListInteractorInput
  
  private lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Constant.dateFormat
    return dateFormatter
  }()
  
  // MARK: - Init
  
  init(interactor: WeatherListInteractorInput) {
    self.interactor = interactor
  }
  
  // MARK: - Private
  
  private func viewModel(for forecast: Forecast, at index: Int) -> ForecastItemViewModel {
    return ForecastItemViewModel(date: dateFormatter.string(from: forecast.date),
                                 image: image(for: forecast),
                                 temperature: "\(forecast.temperatureMax.format(f: ".1"))\(Constant.temperatureUnit)",
                                 color: forecastColor(forIndex: index))
  }
  
  private func image(for forecast: Forecast) -> UIImage {
    let image: UIImage
    switch forecast.type {
    case .brokenClouds:
      image = #imageLiteral(resourceName: "broken_clouds")
    case .clearSky:
      image = #imageLiteral(resourceName: "clear_sky")
    case .fewClouds:
      image = #imageLiteral(resourceName: "few_clouds")
    case .mist:
      image = #imageLiteral(resourceName: "mist")
    case .rain:
      image = #imageLiteral(resourceName: "rain")
    case .scatteredClouds:
      image = #imageLiteral(resourceName: "scattered_clouds")
    case .showerRain:
      image = #imageLiteral(resourceName: "shower_rain")
    case .snow:
      image = #imageLiteral(resourceName: "snow")
    case .thunderstorm:
      image = #imageLiteral(resourceName: "thunderstorm")
    }
    return image
  }
  
  private func forecastColor(forIndex index: Int) -> UIColor {
    return Color.allCases[index % Color.allCases.count].ui
  }
}

// MARK: - WeatherListPresenterInput

extension WeatherListPresenter: WeatherListPresenterInput {
  
  func viewDidLoad() {
    background {
      self.interactor.fetchWeatherForecast()
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
}
