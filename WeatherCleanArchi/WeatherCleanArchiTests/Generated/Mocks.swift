// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import CoreLocation
import LocalAuthentication
#elseif os(OSX)
import AppKit
#endif

@testable import WeatherCleanArchi













class WeatherDetailsInteractorInputMock: WeatherDetailsInteractorInput {

    // MARK: - fetchForecastDetails

    var fetchForecastDetailsCallsCount = 0
    var fetchForecastDetailsCalledOnQueueLabel: String?
    var fetchForecastDetailsCalled: Bool {
        return fetchForecastDetailsCallsCount > 0
    }
    var fetchForecastDetailsClosure: (() -> Void)?

    func fetchForecastDetails() {
        fetchForecastDetailsCallsCount += 1
        fetchForecastDetailsCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        fetchForecastDetailsClosure?()
    }

}
class WeatherDetailsInteractorOutputMock: WeatherDetailsInteractorOutput {

    // MARK: - didFetchForecastDetails

    var didFetchForecastDetailsCallsCount = 0
    var didFetchForecastDetailsCalledOnQueueLabel: String?
    var didFetchForecastDetailsCalled: Bool {
        return didFetchForecastDetailsCallsCount > 0
    }
    var didFetchForecastDetailsReceivedForecast: Forecast?
    var didFetchForecastDetailsClosure: ((Forecast) -> Void)?

    func didFetchForecastDetails(_ forecast: Forecast) {
        didFetchForecastDetailsCallsCount += 1
        didFetchForecastDetailsCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        didFetchForecastDetailsReceivedForecast = forecast
        didFetchForecastDetailsClosure?(forecast)
    }

}
class WeatherDetailsPresenterInputMock: WeatherDetailsPresenterInput {

    // MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalledOnQueueLabel: String?
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        viewDidLoadClosure?()
    }

}
class WeatherDetailsPresenterOutputMock: WeatherDetailsPresenterOutput {

    // MARK: - displayDetails

    var displayDetailsForCallsCount = 0
    var displayDetailsForCalledOnQueueLabel: String?
    var displayDetailsForCalled: Bool {
        return displayDetailsForCallsCount > 0
    }
    var displayDetailsForReceivedViewModel: WeatherDetailsViewModel?
    var displayDetailsForClosure: ((WeatherDetailsViewModel) -> Void)?

    func displayDetails(for viewModel: WeatherDetailsViewModel) {
        displayDetailsForCallsCount += 1
        displayDetailsForCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        displayDetailsForReceivedViewModel = viewModel
        displayDetailsForClosure?(viewModel)
    }

}
class WeatherListInteractorInputMock: WeatherListInteractorInput {

    // MARK: - fetchWeatherForecast

    var fetchWeatherForecastCallsCount = 0
    var fetchWeatherForecastCalledOnQueueLabel: String?
    var fetchWeatherForecastCalled: Bool {
        return fetchWeatherForecastCallsCount > 0
    }
    var fetchWeatherForecastClosure: (() -> Void)?

    func fetchWeatherForecast() {
        fetchWeatherForecastCallsCount += 1
        fetchWeatherForecastCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        fetchWeatherForecastClosure?()
    }

    // MARK: - getWeatherForecastForDetails

    var getWeatherForecastForDetailsAtCallsCount = 0
    var getWeatherForecastForDetailsAtCalledOnQueueLabel: String?
    var getWeatherForecastForDetailsAtCalled: Bool {
        return getWeatherForecastForDetailsAtCallsCount > 0
    }
    var getWeatherForecastForDetailsAtReceivedIndex: Int?
    var getWeatherForecastForDetailsAtClosure: ((Int) -> Void)?

    func getWeatherForecastForDetails(at index: Int) {
        getWeatherForecastForDetailsAtCallsCount += 1
        getWeatherForecastForDetailsAtCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        getWeatherForecastForDetailsAtReceivedIndex = index
        getWeatherForecastForDetailsAtClosure?(index)
    }

}
class WeatherListInteractorOutputMock: WeatherListInteractorOutput {

    // MARK: - didFetchWeatherForecast

    var didFetchWeatherForecastCallsCount = 0
    var didFetchWeatherForecastCalledOnQueueLabel: String?
    var didFetchWeatherForecastCalled: Bool {
        return didFetchWeatherForecastCallsCount > 0
    }
    var didFetchWeatherForecastReceivedForecasts: [Forecast]?
    var didFetchWeatherForecastClosure: (([Forecast]) -> Void)?

    func didFetchWeatherForecast(_ forecasts: [Forecast]) {
        didFetchWeatherForecastCallsCount += 1
        didFetchWeatherForecastCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        didFetchWeatherForecastReceivedForecasts = forecasts
        didFetchWeatherForecastClosure?(forecasts)
    }

    // MARK: - didFailToFetchWeatherForecast

    var didFailToFetchWeatherForecastCallsCount = 0
    var didFailToFetchWeatherForecastCalledOnQueueLabel: String?
    var didFailToFetchWeatherForecastCalled: Bool {
        return didFailToFetchWeatherForecastCallsCount > 0
    }
    var didFailToFetchWeatherForecastClosure: (() -> Void)?

    func didFailToFetchWeatherForecast() {
        didFailToFetchWeatherForecastCallsCount += 1
        didFailToFetchWeatherForecastCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        didFailToFetchWeatherForecastClosure?()
    }

    // MARK: - didGetWeatherForecastForDetails

    var didGetWeatherForecastForDetailsCallsCount = 0
    var didGetWeatherForecastForDetailsCalledOnQueueLabel: String?
    var didGetWeatherForecastForDetailsCalled: Bool {
        return didGetWeatherForecastForDetailsCallsCount > 0
    }
    var didGetWeatherForecastForDetailsReceivedForecast: Forecast?
    var didGetWeatherForecastForDetailsClosure: ((Forecast) -> Void)?

    func didGetWeatherForecastForDetails(_ forecast: Forecast) {
        didGetWeatherForecastForDetailsCallsCount += 1
        didGetWeatherForecastForDetailsCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        didGetWeatherForecastForDetailsReceivedForecast = forecast
        didGetWeatherForecastForDetailsClosure?(forecast)
    }

}
class WeatherListPresenterInputMock: WeatherListPresenterInput {

    // MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalledOnQueueLabel: String?
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        viewDidLoadClosure?()
    }

    // MARK: - didTapWeatherForecast

    var didTapWeatherForecastAtCallsCount = 0
    var didTapWeatherForecastAtCalledOnQueueLabel: String?
    var didTapWeatherForecastAtCalled: Bool {
        return didTapWeatherForecastAtCallsCount > 0
    }
    var didTapWeatherForecastAtReceivedIndex: Int?
    var didTapWeatherForecastAtClosure: ((Int) -> Void)?

    func didTapWeatherForecast(at index: Int) {
        didTapWeatherForecastAtCallsCount += 1
        didTapWeatherForecastAtCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        didTapWeatherForecastAtReceivedIndex = index
        didTapWeatherForecastAtClosure?(index)
    }

}
class WeatherListPresenterOutputMock: WeatherListPresenterOutput {

    // MARK: - displayWeatherForecastList

    var displayWeatherForecastListCallsCount = 0
    var displayWeatherForecastListCalledOnQueueLabel: String?
    var displayWeatherForecastListCalled: Bool {
        return displayWeatherForecastListCallsCount > 0
    }
    var displayWeatherForecastListReceivedForecastItemViewModels: [ForecastItemViewModel]?
    var displayWeatherForecastListClosure: (([ForecastItemViewModel]) -> Void)?

    func displayWeatherForecastList(_ forecastItemViewModels: [ForecastItemViewModel]) {
        displayWeatherForecastListCallsCount += 1
        displayWeatherForecastListCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        displayWeatherForecastListReceivedForecastItemViewModels = forecastItemViewModels
        displayWeatherForecastListClosure?(forecastItemViewModels)
    }

    // MARK: - displayWeatherForecastLoadingError

    var displayWeatherForecastLoadingErrorCallsCount = 0
    var displayWeatherForecastLoadingErrorCalledOnQueueLabel: String?
    var displayWeatherForecastLoadingErrorCalled: Bool {
        return displayWeatherForecastLoadingErrorCallsCount > 0
    }
    var displayWeatherForecastLoadingErrorClosure: (() -> Void)?

    func displayWeatherForecastLoadingError() {
        displayWeatherForecastLoadingErrorCallsCount += 1
        displayWeatherForecastLoadingErrorCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        displayWeatherForecastLoadingErrorClosure?()
    }

}
class WeatherRepositoryInputMock: WeatherRepositoryInput {

    // MARK: - getWeatherForecast

    var getWeatherForecastCityUnitsNbDaysSuccessFailureCallsCount = 0
    var getWeatherForecastCityUnitsNbDaysSuccessFailureCalledOnQueueLabel: String?
    var getWeatherForecastCityUnitsNbDaysSuccessFailureCalled: Bool {
        return getWeatherForecastCityUnitsNbDaysSuccessFailureCallsCount > 0
    }
    var getWeatherForecastCityUnitsNbDaysSuccessFailureReceivedArguments: (city: String, units: String, nbDays: Int, success: ([Forecast]) -> Void, failure: (Error) -> Void)?
    var getWeatherForecastCityUnitsNbDaysSuccessFailureClosure: ((String, String, Int, @escaping ([Forecast]) -> Void, @escaping (Error) -> Void) -> Void)?

    func getWeatherForecast(city: String, units: String, nbDays: Int, success: @escaping ([Forecast]) -> Void, failure: @escaping (Error) -> Void) {
        getWeatherForecastCityUnitsNbDaysSuccessFailureCallsCount += 1
        getWeatherForecastCityUnitsNbDaysSuccessFailureCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        getWeatherForecastCityUnitsNbDaysSuccessFailureReceivedArguments = (city: city, units: units, nbDays: nbDays, success: success, failure: failure)
        getWeatherForecastCityUnitsNbDaysSuccessFailureClosure?(city, units, nbDays, success, failure)
    }

}
class WeatherRouterMock: WeatherRouter {

    // MARK: - routeTo

    var routeToRouteCallsCount = 0
    var routeToRouteCalledOnQueueLabel: String?
    var routeToRouteCalled: Bool {
        return routeToRouteCallsCount > 0
    }
    var routeToRouteReceivedRoute: WeatherRoute?
    var routeToRouteClosure: ((WeatherRoute) -> Void)?

    func routeTo(route: WeatherRoute) {
        routeToRouteCallsCount += 1
        routeToRouteCalledOnQueueLabel = String(cString: __dispatch_queue_get_label(nil))
        routeToRouteReceivedRoute = route
        routeToRouteClosure?(route)
    }

}
