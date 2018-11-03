//
//  Color.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

enum Color: UInt, CaseIterable {
  case watermelon = 0xFF5670
  case yellow = 0xFFCE00
  case darkMagenta = 0xA90097
  case greenBlue = 0x08A4A9
}

extension Color {
  
  var ui: UIColor {
    return UIColor(hexVal: rawValue)
  }
}
