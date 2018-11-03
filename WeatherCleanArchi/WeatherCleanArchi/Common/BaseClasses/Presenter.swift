//
//  Presenter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import Foundation

class Presenter {
  
  func main(execute work: @escaping VoidFunction) {
    DispatchQueue.main.async(execute: work)
  }
  
  func background(execute work: @escaping VoidFunction) {
    DispatchQueue.background.async(execute: work)
  }
}
