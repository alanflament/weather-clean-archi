//
//  TemperatureEntity.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

struct TemperatureEntity: Decodable {
  let day: Double
  let min: Double
  let max: Double
  let night: Double
  let eve: Double
  let morn: Double
}
