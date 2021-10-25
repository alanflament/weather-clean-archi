//
//  WeatherPresenterHelper.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherPresenterHelper {
  
  // MARK: - Constant
  
  private enum Constant {
    static let dateFormat = "MMMM d, yyyy"
    static let temperatureUnit = "°C"
  }
  
  // MARK: - Property
  
  private static var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = Constant.dateFormat
    return dateFormatter
  }()
  
  // MARK: - Public
  
  static func formattedDate(for forecast: Forecast) -> String {
    return dateFormatter.string(from: forecast.date)
  }
  
  static func formattedTemperature(for temperature: Double) -> String {
    return "\(temperature.format(f: ".1"))\(Constant.temperatureUnit)"
  }
  
  static func image(for forecast: Forecast) -> UIImage {
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
  
  static func color(for forecast: Forecast) -> UIColor {
    let color: UIColor
    switch forecast.type {
    case .brokenClouds:
      color = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)
    case .clearSky:
      color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    case .fewClouds:
      color = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
    case .mist:
      color = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    case .rain:
      color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    case .scatteredClouds:
      color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    case .showerRain:
      color = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    case .snow:
      color = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    case .thunderstorm:
      color = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    }
    return color
  }
}
