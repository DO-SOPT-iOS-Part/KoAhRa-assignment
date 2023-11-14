//
//  WeatherCollectionViewCell.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/30.
//

import UIKit

import SnapKit

class WeatherCollectionViewCell: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiterals.Main.img_smallBackground
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayBold(size: 24)
        label.textColor = .WeatherWhite
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 17)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 16)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayLight(size: 52)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let tempHighLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 15)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let tempLowLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 15)
        label.textColor = .WeatherWhite
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Extensions
extension WeatherCollectionViewCell {
    func setUI() {
        self.backgroundColor = .black
    }
    
    func setHierarchy() {
        backgroundImage.addSubviews(titleLabel, locationLabel, weatherLabel, tempLabel, tempLowLabel, tempHighLabel)
        contentView.addSubview(backgroundImage)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(23)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        tempLowLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(tempLabel.snp.trailing)
        }
        
        tempHighLabel.snp.makeConstraints {
            $0.bottom.equalTo(tempLowLabel.snp.bottom)
            $0.trailing.equalTo(tempLowLabel.snp.leading).offset(-6)
        }
    }
    
    func setDataBind(model: MainEntity) {
        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HHmm"
        let currentTime = formatterTime.string(from: Date())
        let hour = Int(currentTime.prefix(2))!
        let min = currentTime.suffix(2)
        
        if (tag == 0) {
            titleLabel.text = "나의 위치"
            locationLabel.text = model.name
        } else {
            titleLabel.text = model.name
            if (hour > 12) { locationLabel.text = "오후 \(hour-12):\(min)"}
            else { locationLabel.text = "오전 \(hour):\(min)" }
        }
        weatherLabel.text = model.weather[0].main
        
        let temp = Int(round(model.main.temp))
        let tempLow = Int(round(model.main.tempMin))
        let tempHigh = Int(round(model.main.tempMax))
        tempLabel.text = "\(temp)°"
        tempLowLabel.text = "최저 : \(tempLow)°"
        tempHighLabel.text = "최고 : \(tempHigh)°"
    }
}
