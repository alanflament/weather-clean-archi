//
//  WeatherAPI.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Moya

enum WeatherAPI {
  case getWeatherForecast(city: String, units: String, nbDays: Int)
}

extension WeatherAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://api.openweathermap.org/")!
  }
  
  var path: String {
    switch self {
    case .getWeatherForecast:
      return "data/2.5/forecast/daily"
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
  
  var method: Method {
    switch self {
    case .getWeatherForecast:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getWeatherForecast(let city, let units, let nbDays):
      return .requestParameters(parameters: ["q": city,
                                             "units": units,
                                             "cnt": nbDays,
                                             "mode": "json",
                                             "APPID": "648a3aac37935e5b45e09727df728ac2"], // TODO: extract
                                encoding: URLEncoding.default)
    }
  }
  
  var sampleData: Data {
    switch self {
    case .getWeatherForecast:
      return Data() // TODO: ...
    }
  }
}
