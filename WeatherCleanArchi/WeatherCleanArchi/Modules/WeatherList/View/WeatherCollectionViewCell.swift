//
//  WeatherCollectionViewCell.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

  // MARK: - Constant
  
  static let identifier = "\(WeatherCollectionViewCell.self)"
  
  // MARK: - Outlets
  
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var weatherImageView: UIImageView!
  @IBOutlet private weak var temperatureLabel: UILabel!
  
  // MARK: - Properties
  
  var viewModel: ForecastItemViewModel? {
    didSet {
      dateLabel.text = viewModel?.date
      weatherImageView.image = viewModel?.image
      temperatureLabel.text = viewModel?.temperature
      backgroundColor = viewModel?.color
    }
  }
  
  // MARK: - Lifecycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    dateLabel.text = nil
    weatherImageView.image = nil
    temperatureLabel.text = nil
  }
  
  // MARK: - Private
  
  private func setupUI() {
    dateLabel.textColor = .white
    dateLabel.font = .systemFont(ofSize: 20)
    temperatureLabel.textColor = .white
    temperatureLabel.font = .systemFont(ofSize: 55, weight: .light)
    layer.cornerRadius = 15
  }
}
