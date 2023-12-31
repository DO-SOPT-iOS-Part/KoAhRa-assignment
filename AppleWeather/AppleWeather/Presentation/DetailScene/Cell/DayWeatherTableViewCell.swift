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
        label.textAlignment = .right
        return label
    }()
    
    private let gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .gradientBackground
        view.layer.cornerRadius = 2
        return view
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.gradientStart.cgColor, UIColor.gradientEnd.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = 2
        return gradient
    }()
    
    private let nowTempImage: UIImageView = UIImageView(image: ImageLiterals.Detail.ic_dot)
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .WeatherGray6
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private let highTempLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 22)
        label.textColor = .WeatherWhite
        label.textAlignment = .right
        return label
    }()
    
    private let tempView = UIView()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .WeatherGray5
        return line
    }()
    
    // MARK: - Life Cycles
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
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
        self.addSubviews(dayLabel, stackView, highTempLabel, gradientView, lowTempLabel, lineView)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
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
        
        highTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(40)
        }
        
        gradientView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(highTempLabel.snp.leading).offset(-9)
            $0.width.equalTo(100)
            $0.height.equalTo(4)
        }
        
        lowTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(gradientView.snp.leading).offset(-9)
            $0.width.equalTo(40)
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
    
    func setGradientView(model: DayWeather, lowestTemp: Int, nowTemp: Int, highestTemp: Int) {
        let gradientLength = CGFloat(model.highTemp - model.lowTemp)
        let totalLength = CGFloat(highestTemp - lowestTemp)
        let width = gradientLength / totalLength * 100
    
        gradientLayer.frame = CGRect(x: CGFloat(model.lowTemp - lowestTemp) / totalLength * 100, y: 0, width: width, height: 4)
        
        if model.day == "오늘" {
            gradientView.addSubviews(circleView, nowTempImage)
            circleView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(CGFloat(nowTemp - lowestTemp) / totalLength * 100)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(10)
            }
            nowTempImage.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(CGFloat(nowTemp - lowestTemp) / totalLength * 100)
                $0.centerY.equalToSuperview()
                $0.size.equalTo(10)
            }
        }
        gradientView.setNeedsDisplay()
    }
}
