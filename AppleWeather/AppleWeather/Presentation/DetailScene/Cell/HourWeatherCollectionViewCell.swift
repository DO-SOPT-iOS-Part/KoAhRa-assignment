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
        stackview.spacing = 14
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
            $0.size.equalTo(44)
        }
        
        tempLabel.snp.makeConstraints {
            $0.height.equalTo(28)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(122)
        }
    }
    
    func setDataBind(model: DetailWeather) {
        timeLabel.text = "\(model.time)시"
        tempLabel.text = "\(model.temp)°"
        
        switch model.weather {
        case "rain": weatherImage.image = ImageLiterals.Detail.ic_rain
        case "lightrain": weatherImage.image = ImageLiterals.Detail.ic_lightrain
        case "thunder": weatherImage.image = ImageLiterals.Detail.ic_thunder
        case "sunnyrain": weatherImage.image = ImageLiterals.Detail.ic_sunnyrain
        case "cloud": weatherImage.image = ImageLiterals.Detail.ic_cloud
        default:
            weatherImage.image = ImageLiterals.Detail.ic_rain
        }
    }
}
