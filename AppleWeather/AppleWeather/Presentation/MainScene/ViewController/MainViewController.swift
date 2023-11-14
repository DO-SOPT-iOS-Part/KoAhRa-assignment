//
//  MainViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var filteredArray: [String] = []
    var searchArray: [String] = []
    var isFiltering : Bool = false
    
    let city: [String] = ["seoul", "jeju", "busan", "sokcho", "chuncheon"]
    var mainEntity: [MainEntity?] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - UI Components
    
    private let mainView = MainView()
    private lazy var collectionView = mainView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        getMainAPI()
    }
}

// MARK: - Extensions

extension MainViewController {
    func setDelegate() {
        mainView.searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func getMainAPI() {
        Task {
            for i in city {
                do {
                    let result = try await WeatherService.shared.getMainWeather(city: i)
                    mainEntity.append(result)
                    searchArray.append(result?.name ?? "")
                } catch {
                    print(error)
                }
            }
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
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? WeatherCollectionViewCell {
            if isFiltering {
                if let searchText = selectedCell.locationLabel.text,
                   let index = searchArray.firstIndex(of: searchText) {
                    nav.initialPage = index
                }
            } else {
                nav.initialPage = indexPath.item
            }
        }
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
        return isFiltering ? filteredArray.count : mainEntity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = WeatherCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
        if isFiltering {
            if let data = mainEntity.first(where: { $0?.name == filteredArray[indexPath.item] }) {
                cell.tag = indexPath.item
                cell.setDataBind(model: data!)
            }
        } else {
            cell.tag = indexPath.item
            cell.setDataBind(model: mainEntity[indexPath.item]!)
        }
        return cell
    }
}
