//
//  DetailTitleView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class DetailTitleView: UIView {
    
    // MARK: - UI Components
    
    var locationDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 36)
        label.textColor = .WeatherWhite
        return label
    }()
    
    var tempDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayThin(size: 102)
        label.textColor = .WeatherWhite
        return label
    }()
    
    var weatherDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 24)
        label.textColor = .WeatherWhite
        return label
    }()
    
    var tempLowHighDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 20)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 4
        stackview.addArrangedSubviews(locationDetailLabel, tempDetailLabel, weatherDetailLabel, tempLowHighDetailLabel)
        return stackview
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTitleView {
    func setHierarchy() {
        self.addSubview(stackView)
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDataBind(model: WeatherEntity) {
        locationDetailLabel.text = model.location
        tempDetailLabel.text = "\(model.temp)°"
        weatherDetailLabel.text = model.weather
        tempLowHighDetailLabel.text = "최고 : \(model.tempHigh)° 최저 : \(model.tempLow)°"
    }
}
