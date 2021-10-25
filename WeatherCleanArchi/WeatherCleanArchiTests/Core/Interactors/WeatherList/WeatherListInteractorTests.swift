//
//  WeatherListInteractorTests.swift
//  WeatherCleanArchiTests
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import XCTest
import Nimble

@testable import WeatherCleanArchi

class WeatherListInteractorTests: XCTestCase {
  
  var interactor: WeatherListInteractor!
  var repository: WeatherRepositoryInputMock!
  var output: WeatherListInteractorOutputMock!
  
  override func setUp() {
    repository = WeatherRepositoryInputMock()
    interactor = WeatherListInteractor(repository: repository)
    output = WeatherListInteractorOutputMock()
    interactor.output = output
  }
  
  func test_repositorySuccess_calls_outputDidFetchWithCorrectArgs() {
    // Given
    let forecasts = [Forecast.stub()]
    repository.getWeatherForecastCityUnitsNbDaysSuccessFailureClosure = { _, _, _, success, _ in
      success(forecasts)
    }
    // When
    interactor.fetchWeatherForecast()
    // Expect
    expect(self.output.didFetchWeatherForecastCallsCount).to(equal(1))
    expect(self.output.didFetchWeatherForecastReceivedForecasts).to(equal(forecasts))
  }
  
  func test_repositoryFailure_calls_outputDidFailFetch() {
    // Given
    repository.getWeatherForecastCityUnitsNbDaysSuccessFailureClosure = { _, _, _, _, failure in
      failure(ErrorMock.errorMock)
    }
    // When
    interactor.fetchWeatherForecast()
    // Expect
    expect(self.output.didFailToFetchWeatherForecastCallsCount).to(equal(1))
  }
}
