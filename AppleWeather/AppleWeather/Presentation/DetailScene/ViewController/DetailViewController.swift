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
    
    var indexPage: Int = 0 {
        didSet {
            collectionView.reloadData()
            tableView.reloadData()
        }
    }
    
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    private enum HeaderHeight {
        static let statusBarHeight = UIApplication.shared.statusBarFrame.height + 6
        static let stickyHeaderHeightMin = 80.0
        static let stickyHeaderHeightMax = 220.0
        static var stickyHeaderHeightMaxWithoutStatusBar: Double {
            stickyHeaderHeightMax - statusBarHeight
        }
    }
    
    private var lowestTemp: Int = 0
    private var highestTemp: Int = 0
    
    // MARK: - UI Components
    
    private let backgroundImage: UIImageView = UIImageView(image: ImageLiterals.Detail.img_bigBackground)
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailTitleView = DetailTitleView()
    private let detailSmallTitleView = DetailSmallTitleView()
    
    private let detailCollectionView = DetailCollectionView()
    lazy var collectionView = detailCollectionView.DetailCollectionView
    private let detailTableView = DetailTableView()
    lazy var tableView = detailTableView.DetailTableView
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        findMinMaxTemp()
    }
}

// MARK: - Extensions

extension DetailViewController {
    func setUI() {
        detailSmallTitleView.alpha = 0
    }
    
    func setHierarchy() {
        view.addSubviews(backgroundImage, scrollView, detailSmallTitleView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(detailTitleView, detailCollectionView, detailTableView)
    }
    
    func setLayout() {
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
        }
        
        detailTitleView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(HeaderHeight.stickyHeaderHeightMax)
        }
        
        detailSmallTitleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(HeaderHeight.stickyHeaderHeightMin)
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
        scrollView.delegate = self
    }
    
    func setDataBind(index: Int) {
        detailTitleView.setDataBind(model: weatherEntity[index])
        detailSmallTitleView.setDataBind(model: weatherEntity[index])
        self.indexPage = index
    }
    
    func findMinMaxTemp() {
        let model = weatherEntity[indexPage].dayWeather
        self.lowestTemp = model.first?.lowTemp ?? 0
        self.highestTemp = model.first?.highTemp ?? 0
        
        for i in 0..<model.count {
            if model[i].lowTemp < self.lowestTemp {
                self.lowestTemp = model[i].lowTemp
            }
            if model[i].highTemp > self.highestTemp {
                self.highestTemp = model[i].highTemp
            }
        }
    }
}

extension DetailViewController: UICollectionViewDelegate {
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        HourWeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        cell.setDataBind(model: weatherEntity[indexPage].detailWeather[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherEntity[indexPage].detailWeather.count
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DayWeatherTableViewCell.dequeueReusableCell(tableView: tableView, indexPath: indexPath)
        cell.setDataBind(model: weatherEntity[indexPage].dayWeather[indexPath.row])
        cell.setGradientView(model: weatherEntity[indexPage].dayWeather[indexPath.row], highestTemp: self.highestTemp, lowestTemp: self.lowestTemp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherEntity[indexPage].dayWeather.count
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffset: CGFloat = HeaderHeight.stickyHeaderHeightMaxWithoutStatusBar
        
        var remainingTopSpacingRatio: CGFloat
        if offsetY >= maxOffset {
            remainingTopSpacingRatio = 0
            scrollView.snp.updateConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide).offset(HeaderHeight.stickyHeaderHeightMin + 20)
            }
            self.view.layoutIfNeeded()
        } else {
            remainingTopSpacingRatio = 1 - (offsetY / maxOffset)
            scrollView.snp.updateConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide)
            }
        }
        detailTitleView.alpha = remainingTopSpacingRatio
        detailSmallTitleView.alpha = 1 - remainingTopSpacingRatio
    }
}
