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
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let detailTitleView = DetailTitleView()
    private let detailCollectionView = DetailCollectionView()
    private lazy var collectionView = detailCollectionView.DetailCollectionView
    private let detailTableView = DetailTableView()
    private lazy var tableView = detailTableView.DetailTableView
    
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
        view.addSubviews(backgroundImage, scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(detailTitleView, detailCollectionView, detailTableView)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        detailTitleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.leading.trailing.equalToSuperview()
        }
        
        detailCollectionView.snp.makeConstraints {
            $0.top.equalTo(detailTitleView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(220)
        }
        
        detailTableView.snp.makeConstraints {
            $0.top.equalTo(detailCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(86)
            $0.height.equalTo(675)
        }
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
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

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DayWeatherHeaderView.dequeueReusableHeaderFooterView(tableView: tableView)
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherEntity[index].dayWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DayWeatherTableViewCell.dequeueReusableCell(tableView: tableView, indexPath: indexPath)
        cell.setDataBind(model: weatherEntity[index].dayWeather[indexPath.row])
        return cell
    }
}
