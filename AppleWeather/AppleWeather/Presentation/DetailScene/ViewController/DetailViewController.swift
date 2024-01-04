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
    private let city: [String] = ["seoul", "jeju", "busan", "sokcho", "chuncheon"]
    private var detailEntity: [DetailEntity?] = []
    
    private enum HeaderHeight {
        static let stickyHeaderHeightMin = 80.0
        static let stickyHeaderHeightMax = 220.0
    }
    
    private var lowestTemp: Int = 0
    private var highestTemp: Int = 0
    
    private var scrollTopConstraint: Constraint?
    
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
        getDetailAPI()
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
            scrollTopConstraint = $0.top.equalTo(self.view.safeAreaLayoutGuide).constraint
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
        detailTitleView.locationDetailLabel.text = city[index]
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
    
    func getDetailAPI() {
        Task {
            do {
                for i in city {
                    let result = try await WeatherService.shared.getDetailWeather(city: i)
                    detailEntity.append(result)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
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
        
        guard !detailEntity.isEmpty else {
            return cell
        }
        
        if let data = detailEntity[indexPage] {
            cell.tag = indexPath.item
            cell.setDataBind(model: data)
        }
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
        cell.setGradientView(model: weatherEntity[indexPage].dayWeather[indexPath.row], lowestTemp: self.lowestTemp, nowTemp: weatherEntity[indexPage].temp, highestTemp: self.highestTemp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherEntity[indexPage].dayWeather.count
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffset: CGFloat = HeaderHeight.stickyHeaderHeightMax
        var scrollTopInset: CGFloat
        
        var remainingTopSpacingRatio: CGFloat
        if offsetY >= maxOffset {
            remainingTopSpacingRatio = 0
            scrollTopInset = 100
        } else {
            remainingTopSpacingRatio = 1 - (offsetY / maxOffset)
            scrollTopInset = 0
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.detailTitleView.alpha = remainingTopSpacingRatio
            self.detailSmallTitleView.alpha = 1 - remainingTopSpacingRatio
            self.scrollTopConstraint?.update(offset: scrollTopInset)
            self.view.layoutIfNeeded()
        })
    }
}
