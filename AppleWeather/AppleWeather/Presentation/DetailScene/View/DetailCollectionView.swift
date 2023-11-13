//
//  DetailCollectionView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class DetailCollectionView: UIView {
    
    // MARK: - UI Components
    
    private let headerView = HourWeatherHeaderView()
    
    lazy var DetailCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 22
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize.height = 122
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        registerCell()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
private extension DetailCollectionView {
    func setUI() {
        self.backgroundColor = .WeatherGray4
        self.layer.cornerRadius = 15
        self.layer.borderColor = UIColor.WeatherGray5.cgColor
        self.layer.borderWidth = 1
    }
    
    func setHierarchy() {
        self.addSubviews(headerView, DetailCollectionView)
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        DetailCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(150)
        }
    }
    
    func registerCell() {
        HourWeatherCollectionViewCell.register(target: DetailCollectionView)
    }
}
