//
//  WeatherNavigationController.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherNavigationController: UINavigationController {
  
  // MARK: - Init
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setupUI()
  }
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setupUI()
  }
  
  // MARK: - Private
  
  private func setupUI() {
    navigationBar.isTranslucent = false
    navigationBar.tintColor = .brown
    navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    navigationBar.shadowImage = UIImage()
    navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.brown]
  }
}
