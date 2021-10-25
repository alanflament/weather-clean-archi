//
//  Double+Format.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

extension Double {
  
  func format(f: String) -> String {
    return String(format: "%\(f)f", self)
  }
}
