//
//  MainViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let mainView = MainView()
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        setDataBind()
    }
}

// MARK: - Extensions

extension MainViewController {
    func setDelegate() {
        mainView.mainDelegate = self
    }
    
    func setDataBind() {
        mainView.firstWeather.setDataBind(model: weatherEntity[0])
        mainView.secondWeather.setListDataBind(model: weatherEntity[1])
        mainView.thirdWeather.setListDataBind(model: weatherEntity[2])
        mainView.fourthWeather.setListDataBind(model: weatherEntity[3])
        mainView.fifthWeather.setListDataBind(model: weatherEntity[4])
    }
}

extension MainViewController: MainDelegate {
    func weatherTapped(idx: Int) {
        let nav = DetailPageViewController()
        nav.initialPage = idx
        self.navigationController?.pushViewController(nav, animated: true)
    }
}
