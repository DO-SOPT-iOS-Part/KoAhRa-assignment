//
//  MainViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var filteredArray:[String] = []
    var searchArray: [String] = []
    var isFiltering : Bool = false
    
    // MARK: - UI Components
    
    private let mainView = MainView()
    private lazy var collectionView = mainView.collectionView
    private let weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setSearhArray()
    }
}

// MARK: - Extensions

extension MainViewController {
    func setDelegate() {
        mainView.searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setSearhArray() {
        for i in 0..<weatherEntity.count {
            self.searchArray.append(weatherEntity[i].location)
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isFiltering = true
        if searchText.isEmpty {
            filteredArray = searchArray
        } else {
            filteredArray = searchArray.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.text = ""
        mainView.searchBar.resignFirstResponder()
        self.isFiltering = false
        self.collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nav = DetailPageViewController()
        nav.initialPage = indexPath.item
        self.navigationController?.pushViewController(nav, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 117)
        return cellSize
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? filteredArray.count : weatherEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = WeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        
        let data: WeatherEntity
        if isFiltering {
            data = weatherEntity.first { $0.location == filteredArray[indexPath.item] } ?? weatherEntity[0]
        } else {
            data = weatherEntity[indexPath.item]
        }
        cell.setDataBind(model: data)
        return cell
    }
    
}
