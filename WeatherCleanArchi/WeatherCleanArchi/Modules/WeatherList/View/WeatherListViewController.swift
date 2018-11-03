//
//  WeatherListViewController.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
  
  // MARK: - Property
  
  var presenter: WeatherListPresenter!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    title = L10n.Weatherlist.title
  }
}

// MARK: - WeatherListPresenterOutput

extension WeatherListViewController: WeatherListPresenterOutput {
  
}
