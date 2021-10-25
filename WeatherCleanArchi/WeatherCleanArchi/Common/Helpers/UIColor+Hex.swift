//
//  UIColor+Hex.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(hexVal: UInt, alphaVal: CGFloat = 1.0) {
    self.init(
      red: CGFloat((hexVal & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hexVal & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hexVal & 0x0000FF) / 255.0,
      alpha: alphaVal
    )
  }
}
