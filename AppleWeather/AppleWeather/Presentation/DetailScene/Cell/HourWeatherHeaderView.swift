//
//  HourWeatherHeaderView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class HourWeatherHeaderView: UIView {

    // MARK: - UI Components
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
        label.numberOfLines = 0
        label.font = .SFProDisplayMedium(size: 18)
        label.textColor = .WeatherWhite
        return label
    }()
    
    private let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .WeatherGray3
        return line
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

extension HourWeatherHeaderView {
    func setHierarchy() {
        self.addSubviews(headerLabel, lineView)
    }
    
    func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        self.snp.makeConstraints {
            $0.bottom.equalTo(lineView.snp.bottom)
        }
    }
}
