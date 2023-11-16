//
//  HourWeatherCollectionViewCell.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/30.
//

import UIKit

import SnapKit

class HourWeatherCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 17)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 22)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 20
        stackview.addArrangedSubviews(timeLabel, weatherImage, tempLabel)
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

// MARK: - Extensions
extension HourWeatherCollectionViewCell {
    func setHierarchy() {
        self.addSubview(stackView)
    }
    
    func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        
        weatherImage.snp.makeConstraints {
            $0.size.equalTo(26)
        }
        
        tempLabel.snp.makeConstraints {
            $0.height.equalTo(26)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(122)
        }
    }

    func setDataBind(model: DetailEntity) {
        if let currentTime = String.convertToHourString(from: model.list[tag].dtTxt) {
            timeLabel.text = currentTime
        }
        
        let temp = Int(round(model.list[tag].main.temp))
        tempLabel.text = "\(temp)°"
        
        switch model.list[tag].weather[0].main {
        case .clear: weatherImage.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        case .clouds: weatherImage.image = UIImage(systemName: "cloud.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        case .rain: weatherImage.image = UIImage(systemName: "cloud.rain.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        case .snow: weatherImage.image = UIImage(systemName: "cloud.snow.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
    }
}
