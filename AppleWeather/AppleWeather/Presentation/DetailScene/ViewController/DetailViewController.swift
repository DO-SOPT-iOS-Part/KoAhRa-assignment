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
    
    var tt: Int = 0
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case hour, day
    }
    
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
        view.addSubviews(backgroundImage, detailTitleView, collectionView)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(detailTitleView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(67)
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
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .hour:
            let cell =
            HourWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setDataBind(model: weatherEntity[index].detailWeather[indexPath.row])
            return cell
        case .day:
            let cell =
            DayWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.setDataBind(model: weatherEntity[index].dayWeather[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionType.allCases[section]
        switch sectionType {
        case .hour:
            return weatherEntity[index].detailWeather.count
        case .day:
            return weatherEntity[index].dayWeather.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionType = SectionType.allCases[indexPath.section]
        switch sectionType {
        case .hour:
            let headerView = HourWeatherHeaderView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            return headerView
        case .day:
            let headerView = DayWeatherHeaderView.dequeueReusableHeaderView(collectionView: collectionView, indexPath: indexPath)
            return headerView
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
}
