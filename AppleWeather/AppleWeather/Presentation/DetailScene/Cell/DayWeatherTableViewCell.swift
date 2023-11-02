//
//  DayWeatherTableViewCell.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

class DayWeatherTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 22)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let rainPercent: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayBold(size: 15)
        label.textColor = .WeatherBlue
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 1
        stackview.addArrangedSubviews(weatherImage, rainPercent)
        return stackview
    }()
    
    private let lowTempLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 22)
        label.textColor = .WeatherGray5
        return label
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let highTempLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 22)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .WeatherGray5
        return line
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension DayWeatherTableViewCell {
    func setHierarchy() {
        self.addSubviews(dayLabel, stackView, lowTempLabel, highTempLabel, gradientView, lineView)
    }
    
    func setLayout() {
        dayLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(41)
        }
        
        weatherImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(dayLabel.snp.trailing).offset(30)
            $0.width.equalTo(33)
        }
        
        lowTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(stackView.snp.trailing).offset(15)
        }
        
        gradientView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(lowTempLabel.snp.trailing).offset(5)
            $0.trailing.equalTo(highTempLabel.snp.leading).offset(-5)
            $0.height.equalTo(12)
        }
        
        highTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(dayLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(1)
        }
    }
    
    func setDataBind(model: DayWeather) {
        dayLabel.text = "\(model.day)"
        rainPercent.text = model.rain == 0 ? "" : "\(model.rain)%"
        lowTempLabel.text = "\(model.lowTemp)°"
        highTempLabel.text = "\(model.highTemp)°"
        
        switch model.weather {
        case "rain": weatherImage.image = UIImage(systemName: "cloud.rain.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        case "sunny": weatherImage.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        case "cloudsun": weatherImage.image = UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal)
        default:
            weatherImage.image = ImageLiterals.Detail.ic_rain
        }
    }
}
