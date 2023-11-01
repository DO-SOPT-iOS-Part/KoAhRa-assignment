//
//  DayWeatherHeaderView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class DayWeatherHeaderView: UICollectionReusableView, UICollectionHeaderViewRegisterable {
    
    // MARK: - Properties
    
    static let isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let iconImage: UIImageView = UIImageView(image: ImageLiterals.Detail.ic_calendar)
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "10일간의 일기예보"
        label.font = .SFProDisplayMedium(size: 15)
        label.textColor = .WeatherGray5
        return label
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

extension DayWeatherHeaderView {
    func setHierarchy() {
        self.addSubviews(iconImage, headerLabel)
    }
    
    func setLayout() {
        iconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.size.equalTo(24)
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(5)
        }
    }
}
