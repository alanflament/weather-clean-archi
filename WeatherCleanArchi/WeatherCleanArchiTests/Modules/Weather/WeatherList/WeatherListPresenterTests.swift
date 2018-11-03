//
//  WeatherListPresenterTests.swift
//  WeatherCleanArchiTests
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import XCTest
import Nimble

@testable import WeatherCleanArchi

class WeatherListPresenterTests: XCTestCase {

  var presenter: WeatherListPresenter!
  var interactor: WeatherListInteractorInputMock!
  var router: WeatherRouterMock!
  var output: WeatherListPresenterOutputMock!
  
  override func setUp() {
    router = WeatherRouterMock()
    interactor = WeatherListInteractorInputMock()
    presenter = WeatherListPresenter(interactor: interactor, router: router)
    output = WeatherListPresenterOutputMock()
    presenter.output = output
  }
  
  func test_viewDidLoad_callsInteractorFetchOnBackground() {
    // When
    presenter.viewDidLoad()
    // Then
    expect(self.interactor.fetchWeatherForecastCallsCount).toEventually(equal(1))
    expect(self.interactor.fetchWeatherForecastCalledOnQueueLabel).toEventually(equal(DispatchQueue.background.label))
  }
  
  func test_didFetchWeatherForecast_callsOutputDisplayListOnMainThreadWithCorrectArgs() {
    // Given
    let forecast = Forecast.stub(date: Date(timeIntervalSince1970: Double(1541242800)), temperatureMax: 30.5)
    // When
    presenter.didFetchWeatherForecast([forecast])
    // Then
    expect(self.output.displayWeatherForecastListCallsCount).toEventually(equal(1))
    expect(self.output.displayWeatherForecastListCalledOnQueueLabel).toEventually(equal(DispatchQueue.main.label))
    expect(self.output.displayWeatherForecastListReceivedForecastItemViewModels?.count).toEventually(equal(1))
    expect(self.output.displayWeatherForecastListReceivedForecastItemViewModels?.first?.date).toEventually(equal("November 3, 2018"))
    expect(self.output.displayWeatherForecastListReceivedForecastItemViewModels?.first?.temperature).toEventually(equal("30.5°C"))
  }
}
