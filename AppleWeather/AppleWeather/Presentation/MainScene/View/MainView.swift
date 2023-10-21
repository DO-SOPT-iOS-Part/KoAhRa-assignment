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
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private let searchBar: UISearchBar = {
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
    
    lazy var firstWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var secondWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var thirdWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var fourthWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var fifthWeather: WeatherView = {
        let view = WeatherView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(weatherTapped))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MainView {
    func setHierarchy() {
        scrollView.addSubviews(firstWeather, secondWeather, thirdWeather, fourthWeather, fifthWeather)
        self.addSubviews(moreButton, titleLabel, searchBar, scrollView)
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
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        firstWeather.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        secondWeather.snp.makeConstraints {
            $0.top.equalTo(firstWeather.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        thirdWeather.snp.makeConstraints {
            $0.top.equalTo(secondWeather.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        fourthWeather.snp.makeConstraints {
            $0.top.equalTo(thirdWeather.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
        
        fifthWeather.snp.makeConstraints {
            $0.top.equalTo(fourthWeather.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
    }
    
    @objc
    func weatherTapped() {
        print("✅")
    }
}
