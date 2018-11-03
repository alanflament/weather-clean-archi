//
//  AppDelegate.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var appRouter: AppRouter!
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    appRouter = AppRouter()

    window = UIWindow()
    window?.rootViewController = appRouter.rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }
}
