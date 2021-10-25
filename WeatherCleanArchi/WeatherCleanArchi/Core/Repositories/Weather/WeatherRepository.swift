//
//  WeatherRepository.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Moya

class WeatherRepository {
  
  // MARK: - Property
  
  private let provider = MoyaProvider<WeatherAPI>()
  private let jsonDecoder = JSONDecoder()
  
  // MARK: - Private
  
  private func convertResult(_ forecastEntity: ForecastEntity) -> Forecast? {
    guard let type = forecastType(for: forecastEntity) else { return nil }
    
    return Forecast(date: Date(timeIntervalSince1970: Double(forecastEntity.timestamp)),
                    temperatureMin: forecastEntity.temperature.min,
                    temperatureMax: forecastEntity.temperature.max,
                    type: type,
                    humidity: forecastEntity.humidity,
                    windDirection: forecastEntity.windDirection,
                    windSpeed: forecastEntity.windSpeed)
  }
  
  private func forecastType(for forecastEntity: ForecastEntity) -> ForecastType? {
    guard let icon = forecastEntity.weather.first?.icon else { return nil }
    
    switch icon {
    case "01d", "01n":
      return .clearSky
    case "02d", "02n":
      return .fewClouds
    case "03d", "03n":
      return .scatteredClouds
    case "04d", "04n":
      return .brokenClouds
    case "09d", "09n":
      return .showerRain
    case "10d", "10n":
      return .rain
    case "11d", "11n":
      return .thunderstorm
    case "13d", "13n":
      return .snow
    case "50d", "50n":
      return .mist
    default:
      return nil
    }
  }
}

// MARK: - WeatherRepositoryInput

extension WeatherRepository: WeatherRepositoryInput {
  
  func getWeatherForecast(city: String, units: String, nbDays: Int, success: @escaping ([Forecast]) -> Void, failure: @escaping (Error) -> Void) {
    provider
      .request(.getWeatherForecast(city: city, units: units, nbDays: nbDays)) { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let response):
          do {
            let forecastEntities = try response.map([ForecastEntity].self,
                                                    atKeyPath: "list",
                                                    using: self.jsonDecoder,
                                                    failsOnEmptyData: false)
            
            let forecasts = forecastEntities.compactMap { self.convertResult($0) }
            
            success(forecasts)
          } catch let error {
            failure(error)
          }
        case .failure(let error):
          failure(error)
        }
      }
  }
}
