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
  
  lazy var rootViewController: WeatherNavigationController = {
    return WeatherNavigationController(rootViewController: weatherListViewController())
  }()
  
  // MARK: - Private
  
  private func weatherListViewController() -> WeatherListViewController {
    let repository = WeatherRepository()
    let weatherListInteractor = WeatherListInteractor(repository: repository)
    let weatherListPresenter = WeatherListPresenter(interactor: weatherListInteractor, router: self)
    let weatherListVC = StoryboardScene.WeatherList.weatherListViewController.instantiate()
    weatherListInteractor.output = weatherListPresenter
    weatherListPresenter.output = weatherListVC
    weatherListVC.presenter = weatherListPresenter
    return weatherListVC
  }
  
  private func weatherDetailsViewController(for forecast: Forecast) -> WeatherDetailsViewController {
    let weatherDetailsInteractor = WeatherDetailsInteractor(forecast: forecast)
    let weatherDetailsPresenter = WeatherDetailsPresenter(interactor: weatherDetailsInteractor)
    let weatherDetailsVC = StoryboardScene.WeatherDetails.weatherDetailsViewController.instantiate()
    weatherDetailsInteractor.output = weatherDetailsPresenter
    weatherDetailsPresenter.output = weatherDetailsVC
    weatherDetailsVC.presenter = weatherDetailsPresenter
    return weatherDetailsVC
  }
}

// MARK: - WeatherRouter

extension AppRouter: WeatherRouter {
  
  func routeTo(route: WeatherRoute) {
    let viewController: UIViewController
    switch route {
    case .weatherDetails(let forecast):
      viewController = weatherDetailsViewController(for: forecast)
    }
    rootViewController.pushViewController(viewController, animated: true)
  }
}
