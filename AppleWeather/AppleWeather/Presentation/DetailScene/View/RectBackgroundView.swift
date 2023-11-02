//
//  RectBackgroundView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class RectBackgroundView: UIView {
    
    // MARK: - UI Components
    
    private let rectBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .WeatherGray4
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.WeatherGray3.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierachy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
private extension RectBackgroundView {
    func setUI() {
        self.backgroundColor = .clear
    }
    
    func setHierachy() {
        self.addSubview(rectBackgroundView)
    }
    
    func setLayout() {
        rectBackgroundView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
