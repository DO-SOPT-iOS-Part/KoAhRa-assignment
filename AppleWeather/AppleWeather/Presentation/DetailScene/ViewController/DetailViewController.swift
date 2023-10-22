//
//  DetailViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var index: Int = 0
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - UI Components
    
    private let detailView = DetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setDataBind()
    }

}

// MARK: - Extensions

extension DetailViewController {
    func setDataBind() {
        detailView.setDataBind(model: weatherEntity[index])
        detailView.timeView1.setDataBind(model: weatherEntity[index].detailWeather[0])
        detailView.timeView1.timeLabel.text = "Now"
        detailView.timeView2.setDataBind(model: weatherEntity[index].detailWeather[1])
        detailView.timeView3.setDataBind(model: weatherEntity[index].detailWeather[2])
        detailView.timeView4.setDataBind(model: weatherEntity[index].detailWeather[3])
        detailView.timeView5.setDataBind(model: weatherEntity[index].detailWeather[4])
        detailView.timeView6.setDataBind(model: weatherEntity[index].detailWeather[5])
        detailView.timeView7.setDataBind(model: weatherEntity[index].detailWeather[6])
        detailView.timeView8.setDataBind(model: weatherEntity[index].detailWeather[7])
        detailView.timeView9.setDataBind(model: weatherEntity[index].detailWeather[8])
    }
}
