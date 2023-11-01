//
//  DetailCollectionView.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/11/01.
//

import UIKit

import SnapKit

final class DetailCollectionView: UIView {
    
    // MARK: - Properties
    
    private typealias SectionType = Section
    
    @frozen
    private enum Section: CaseIterable {
        case hour
    }
    
    // MARK: - UI Components
    
    lazy var DetailCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear
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
private extension DetailCollectionView {
    func setHierarchy() {
        self.addSubview(DetailCollectionView)
    }
    
    func setLayout() {
        DetailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func registerCell() {
        HourWeatherHeaderView.register(target: DetailCollectionView)
        HourWeatherCollectionViewCell.register(target: DetailCollectionView)
    }
    
    func setSectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            let sectionType = Section.allCases[sectionIndex]
            switch sectionType {
            case .hour:
                return self.getLayoutHour()
            }
        }
        layout.register(RectBackgroundView.self, forDecorationViewOfKind: "rectBackground")
        return layout
    }
    
    func getLayoutHour() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(44),
            heightDimension: .absolute(122)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.4),
            heightDimension: .absolute(122)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(22)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(57)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 15, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: "rectBackground")
        section.decorationItems = [sectionBackgroundDecoration]
        
        return section
    }
}
