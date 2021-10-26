//
//  WeatherDetailsViewController.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
  
  // MARK: - Property
  
  var presenter: WeatherDetailsPresenterInput!
    
  // MARK: - Outlets
  
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var weatherImageView: UIImageView!
  @IBOutlet private weak var temperatureLabel: UILabel!
  @IBOutlet private weak var temperatureMinTitleLabel: UILabel!
  @IBOutlet private weak var temperatureMinValueLabel: UILabel!
  @IBOutlet private weak var temperatureMaxTitleLabel: UILabel!
  @IBOutlet private weak var temperatureMaxValueLabel: UILabel!
  @IBOutlet private weak var humidityTitleLabel: UILabel!
  @IBOutlet private weak var humidityValueLabel: UILabel!
  @IBOutlet private weak var feelingTitleLabel: UILabel!
  @IBOutlet private weak var feelingValueLabel: UILabel!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Private
  
  private func setupUI() {
    [dateLabel, temperatureLabel, temperatureMinTitleLabel, temperatureMinValueLabel, temperatureMaxTitleLabel,
     temperatureMaxValueLabel, humidityTitleLabel, humidityValueLabel, feelingTitleLabel, feelingValueLabel].forEach {
      $0?.textColor = .white
      $0?.font = .systemFont(ofSize: 18)
    }
    dateLabel.font = .systemFont(ofSize: 20)
    temperatureLabel.font = .systemFont(ofSize: 55, weight: .light)
    
    temperatureMinTitleLabel.text = L10n.Weatherdetails.temperatureMin
    temperatureMaxTitleLabel.text = L10n.Weatherdetails.temperatureMax
    humidityTitleLabel.text = L10n.Weatherdetails.humidity
    feelingTitleLabel.text = L10n.Weatherdetails.feeling
  }
    
    private func displayDetailsDuplicated(for viewModel: WeatherDetailsViewModel) {
        dateLabel.text = viewModel.date
        weatherImageView.image = viewModel.image
        temperatureLabel.text = viewModel.temperature
        temperatureMinValueLabel.text = viewModel.temperatureMin
        temperatureMaxValueLabel.text = viewModel.temperatureMax
        humidityValueLabel.text = viewModel.humidity
        feelingValueLabel.text = viewModel.feeling
        view.backgroundColor = viewModel.color
    }
}

// MARK: - WeatherDetailsPresenterOutput

extension WeatherDetailsViewController: WeatherDetailsPresenterOutput {
  
  func displayDetails(for viewModel: WeatherDetailsViewModel) {
    dateLabel.text = viewModel.date
    weatherImageView.image = viewModel.image
    temperatureLabel.text = viewModel.temperature
    temperatureMinValueLabel.text = viewModel.temperatureMin
    temperatureMaxValueLabel.text = viewModel.temperatureMax
    humidityValueLabel.text = viewModel.humidity
    feelingValueLabel.text = viewModel.feeling
    view.backgroundColor = viewModel.color
  }
}
