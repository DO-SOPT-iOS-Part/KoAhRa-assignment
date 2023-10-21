//
//  MainViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setDataBind()
    }
}

extension MainViewController {
    
    func setDataBind() {
        mainView.firstWeather.setDataBind(model: weatherEntity[0])
        mainView.secondWeather.setDataBind(model: weatherEntity[1])
        mainView.thirdWeather.setDataBind(model: weatherEntity[2])
        mainView.fourthWeather.setDataBind(model: weatherEntity[3])
        mainView.fifthWeather.setDataBind(model: weatherEntity[4])
    }
}
