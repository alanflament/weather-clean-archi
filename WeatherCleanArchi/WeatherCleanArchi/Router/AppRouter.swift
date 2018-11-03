//
//  AppRouter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class AppRouter {
  
  lazy var rootViewController: UINavigationController = {
    return UINavigationController(rootViewController: weatherListViewController())
  }()
  
  private func weatherListViewController() -> WeatherListViewController {
    return StoryboardScene.WeatherList.weatherListViewController.instantiate()
  }
}
