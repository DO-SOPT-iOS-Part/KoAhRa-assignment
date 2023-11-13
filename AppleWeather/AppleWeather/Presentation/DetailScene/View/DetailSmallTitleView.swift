//
//  DetailSmallTitleView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/04.
//

import UIKit

import SnapKit

final class DetailSmallTitleView: UIView {
    
    // MARK: - UI Components
    
    var locationSmallDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 36)
        label.textColor = .WeatherWhite
        return label
    }()
    
    var tempSmallDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplayMedium(size: 20)
        label.textColor = .WeatherWhite
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.addArrangedSubviews(locationSmallDetailLabel, tempSmallDetailLabel)
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

extension DetailSmallTitleView {
    func setHierarchy() {
        self.addSubview(stackView)
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    func setDataBind(model: WeatherEntity) {
        locationSmallDetailLabel.text = model.location
        tempSmallDetailLabel.text = "\(model.temp)° | \(model.weather)"
    }
}
