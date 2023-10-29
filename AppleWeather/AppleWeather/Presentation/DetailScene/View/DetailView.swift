//
//  DetailView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    // MARK: - UI Components
    
    private let backgroundImage: UIImageView = UIImageView(image: ImageLiterals.Detail.img_bigBackground)
    
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
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        label.numberOfLines = 0
        label.font = .SFProDisplayMedium(size: 18)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let rectView: UIView = {
        let rect = UIView()
        rect.backgroundColor = .WeatherGray4
        rect.layer.cornerRadius = 15
        rect.layer.borderColor = UIColor.WeatherGray3.cgColor
        rect.layer.borderWidth = 1
        return rect
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .WeatherGray3
        return line
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var timeView1 = WeatherDetailView()
    lazy var timeView2 = WeatherDetailView()
    lazy var timeView3 = WeatherDetailView()
    lazy var timeView4 = WeatherDetailView()
    lazy var timeView5 = WeatherDetailView()
    lazy var timeView6 = WeatherDetailView()
    lazy var timeView7 = WeatherDetailView()
    lazy var timeView8 = WeatherDetailView()
    lazy var timeView9 = WeatherDetailView()
    
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

extension DetailView {
    func setHierarchy() {
        scrollView.addSubviews(timeView1, timeView2, timeView3, timeView4, timeView5, timeView6, timeView7, timeView8, timeView9)
        self.addSubviews(backgroundImage, stackView, rectView, detailLabel, lineView, scrollView)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(34)
            $0.leading.trailing.equalToSuperview()
        }
        
        rectView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(rectView.snp.top).offset(10)
            $0.leading.equalTo(rectView.snp.leading).offset(15)
            $0.trailing.equalTo(rectView.snp.trailing).offset(15)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(11)
            $0.leading.equalTo(rectView.snp.leading).offset(14)
            $0.trailing.equalTo(rectView.snp.trailing).offset(-14)
            $0.height.equalTo(1)
        }
        
        timeView1.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        
        timeView2.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView1.snp.trailing).offset(22)
        }
        
        timeView3.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView2.snp.trailing).offset(22)
        }
        
        timeView4.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView3.snp.trailing).offset(22)
        }
        
        timeView5.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView4.snp.trailing).offset(22)
        }
        
        timeView6.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView5.snp.trailing).offset(22)
        }
        
        timeView7.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView6.snp.trailing).offset(22)
        }
        
        timeView8.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(timeView7.snp.trailing).offset(22)
        }
        
        timeView9.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(timeView8.snp.trailing).offset(22)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(14)
            $0.leading.equalTo(rectView.snp.leading).offset(15)
            $0.trailing.equalTo(rectView.snp.trailing).offset(-12)
            $0.height.equalTo(122)
        }
    }
    
    func setDataBind(model: WeatherEntity) {
        locationDetailLabel.text = model.location
        tempDetailLabel.text = "\(model.temp)°"
        weatherDetailLabel.text = model.weather
        tempLowHighDetailLabel.text = "최고 : \(model.tempHigh)° 최저 : \(model.tempLow)°"
    }
}
