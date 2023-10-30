//
//  MainView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/16.
//

import UIKit

import SnapKit

final class MainView: UIView {
    
    // MARK: - UI Components
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Main.ic_more, for: .normal)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.font = .SFProDisplayBold(size: 36)
        label.textColor = .WeatherWhite
        return label
    }()
    
    let searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.clipsToBounds = true
        searchbar.layer.cornerRadius = 10
        searchbar.searchTextField.font = .SFProDisplayRegular(size: 19)
        searchbar.searchTextField.backgroundColor = .WeatherGray2
        searchbar.barTintColor = .WeatherGray2
        searchbar.searchTextField.textColor = .white
        searchbar.setImage(ImageLiterals.Main.ic_find, for: .search, state: .normal)
        if let textFieldInsideSearchBar = searchbar.value(forKey: "searchField") as? UITextField {
            let placeholderText = "도시 또는 공항 검색"
            let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.WeatherGray1])
            textFieldInsideSearchBar.attributedPlaceholder = attributedPlaceholder
        }
        return searchbar
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize.height = 117
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.allowsSelection = true
        collectionView.backgroundColor = .black
        return collectionView
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
extension MainView {
    func setHierarchy() {
        self.addSubviews(moreButton, titleLabel, searchBar, collectionView)
    }
    
    func setLayout() {
        moreButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).offset(1)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func registerCell() {
        WeatherCollectionViewCell.register(target: collectionView)
        WeatherCollectionViewCell.register(target: collectionView)
    }
}
