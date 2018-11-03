//
//  WeatherListViewController.swift
//  WeatherCleanArchi
//
//  Created by Alan Flament on 03/11/2018.
//  Copyright © 2018 Alan Flament. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
  
  // MARK: - Constant
  
  private enum Constant {
    static let margin: CGFloat = 15
    static let nbItemsPerLine = 3
  }
  
  // MARK: - Outlets
  
  @IBOutlet private weak var collectionView: UICollectionView!
  
  // MARK: - Property
  
  var presenter: WeatherListPresenter!
  private var forecastItemViewModels: [ForecastItemViewModel] = []
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    title = L10n.Weatherlist.title
    setupCollectionView()
  }
  
  // MARK: - Private
  
  private func setupCollectionView() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UINib(nibName: WeatherCollectionViewCell.identifier, bundle: nil),
                            forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
    collectionView.contentInset = UIEdgeInsets(top: 0,
                                               left: Constant.margin,
                                               bottom: Constant.margin,
                                               right: Constant.margin)
    
    let layout = UICollectionViewFlowLayout()
    let width: CGFloat
    if UIDevice.current.userInterfaceIdiom == .phone {
      width = view.frame.width - Constant.margin * 2
    } else {
      width = (view.frame.width - Constant.margin * (2 + CGFloat(Constant.nbItemsPerLine) - 1)) / CGFloat(Constant.nbItemsPerLine)
    }
    layout.itemSize = CGSize(width: width, height: width)
    layout.minimumLineSpacing = Constant.margin
    layout.minimumInteritemSpacing = Constant.margin
    collectionView.setCollectionViewLayout(layout, animated: false)
  }
}

// MARK: - UICollectionViewDataSource

extension WeatherListViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return forecastItemViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else {
      fatalError("Could not dequeue cell with identifier: \(WeatherCollectionViewCell.identifier)")
    }
    cell.viewModel = forecastItemViewModels[indexPath.row]
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension WeatherListViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

  }
}


// MARK: - WeatherListPresenterOutput

extension WeatherListViewController: WeatherListPresenterOutput {
  
  func displayWeatherForecastList(_ forecastItemViewModels: [ForecastItemViewModel]) {
    self.forecastItemViewModels = forecastItemViewModels
    collectionView.reloadData()
  }
  
  func displayWeatherForecastLoadingError() {
    let alertController = UIAlertController(title: nil,
                                            message: L10n.Weatherlist.Error.Loading.message,
                                            preferredStyle: .alert)
    let okAction = UIAlertAction(title: L10n.General.ok, style: .cancel)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}
