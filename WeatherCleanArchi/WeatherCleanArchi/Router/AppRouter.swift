//
//  AppRouter.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class AppRouter {
  
  // MARK: - Property
  
  lazy var rootViewController: UINavigationController = {
    return UINavigationController(rootViewController: weatherListViewController())
  }()
  
  // MARK: - Private
  
  private func weatherListViewController() -> WeatherListViewController {
    let repository = WeatherRepository()
    let weatherListInteractor = WeatherListInteractor(repository: repository)
    let weatherListPresenter = WeatherListPresenter(interactor: weatherListInteractor)
    let weatherListVC = StoryboardScene.WeatherList.weatherListViewController.instantiate()
    weatherListInteractor.output = weatherListPresenter
    weatherListPresenter.output = weatherListVC
    weatherListVC.presenter = weatherListPresenter
    return weatherListVC
  }
}
