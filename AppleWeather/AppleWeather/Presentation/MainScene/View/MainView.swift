//
//  MainView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - UI Components
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var firstWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var secondWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var thirdWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
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
extension MainView {
    func setHierarchy() {
        scrollView.addSubviews(firstWeather, secondWeather, thirdWeather)
        addSubview(scrollView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        
        firstWeather.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        secondWeather.snp.makeConstraints {
            $0.top.equalTo(firstWeather.snp.bottom).offset(16)
            $0.centerX.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        thirdWeather.snp.makeConstraints {
            $0.top.equalTo(secondWeather.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
    }
    
    @objc
    func weatherTapped() {
        print("✅")
    }
}
