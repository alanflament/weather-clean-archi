//
//  WeatherEntity.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

struct WeatherEntity: Decodable {
  let main: String
  let description: String
  let icon: String
}
