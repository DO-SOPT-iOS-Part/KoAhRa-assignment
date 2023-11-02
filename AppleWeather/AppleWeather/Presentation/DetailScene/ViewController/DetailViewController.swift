//
//  DetailViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

import SnapKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var index: Int = 0
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - UI Components
    
    private let backgroundImage: UIImageView = UIImageView(image: ImageLiterals.Detail.img_bigBackground)
    private let detailTitleView = DetailTitleView()
    private let detailCollectionView = DetailCollectionView()
    private lazy var collectionView = detailCollectionView.DetailCollectionView
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setDelegate()
    }
    
}

// MARK: - Extensions

extension DetailViewController {
    func setHierarchy() {
        view.addSubviews(backgroundImage, detailTitleView, detailCollectionView)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailCollectionView.snp.makeConstraints {
            $0.top.equalTo(detailTitleView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(220)
        }
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setDataBind(index: Int) {
        detailTitleView.setDataBind(model: weatherEntity[index])
    }
}

extension DetailViewController: UICollectionViewDelegate {
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        HourWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setDataBind(model: weatherEntity[index].detailWeather[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherEntity[index].detailWeather.count
    }
}
