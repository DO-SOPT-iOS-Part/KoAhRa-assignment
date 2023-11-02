//
//  DetailTableView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/02.
//

import UIKit

import SnapKit

final class DetailTableView: UIView {
    
    // MARK: - UI Components
    
    private let rectView = RectBackgroundView()
    
    lazy var DetailTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.sectionFooterHeight = 0
        tableView.sectionHeaderTopPadding = 0
        tableView.isScrollEnabled = true
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        return tableView
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension DetailTableView {
    func setHierarchy() {
        self.addSubview(rectView)
        rectView.addSubview(DetailTableView)
    }
    
    func setLayout() {
        rectView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        DetailTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    func registerCell() {
        DayWeatherHeaderView.register(target: DetailTableView)
        DayWeatherTableViewCell.register(target: DetailTableView)
    }
}
