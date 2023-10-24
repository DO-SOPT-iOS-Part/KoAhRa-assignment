//
//  DetailPageViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/23.
//

import UIKit

import SnapKit

final class DetailPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    var initialPage = 0
    private var pages = [UIViewController]()
    private var weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - UI Components
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .WeatherWhite
        pageControl.pageIndicatorTintColor = .WeatherWhite.withAlphaComponent(0.3)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolbar.backgroundColor = .clear
        toolbar.tintColor = .WeatherWhite
        toolbar.barTintColor = .clear
        toolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    private let underlineView: UIView = {
        let line = UIView()
        line.backgroundColor = .WeatherGray3
        return line
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Detail.ic_map, for: .normal)
        return button
    }()
    
    private lazy var listButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiterals.Detail.ic_list, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPage()
        setUI()
        setDelegate()
        setHierarchy()
        setLayout()
        setToolBar()
        setAddTarget()
    }
}

// MARK: - Extensions

extension DetailPageViewController {
    func setPage() {
        for i in 0..<weatherEntity.count {
            let detailVC = DetailViewController()
            detailVC.setDataBind(index: i)
            pages.append(detailVC)
        }
        self.pageControl.numberOfPages = weatherEntity.count
        self.pageControl.setIndicatorImage(ImageLiterals.Detail.ic_nav, forPage: 0)
        self.pageControl.currentPage = initialPage
    }
    
    func setDelegate() {
        self.dataSource = self
        self.delegate = self
    }
    
    func setUI() {
        self.setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
    
    func setHierarchy() {
        view.addSubviews(toolbar, underlineView)
    }
    
    func setLayout() {
        toolbar.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
        
        underlineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(toolbar.snp.top)
            $0.height.equalTo(1)
        }
    }
    
    func setToolBar() {
        let leftButton = UIBarButtonItem(customView: mapButton)
        let rightButton = UIBarButtonItem(customView: listButton)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let pageControl = UIBarButtonItem(customView: pageControl)
        toolbar.setItems([leftButton, flexibleSpace, pageControl, flexibleSpace, rightButton], animated: true)
    }
    
    func setAddTarget() {
        mapButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        listButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
    }
    
    @objc
    func tapButton(_ sender: UIButton) {
        switch sender {
        case mapButton:
            print("🗺️")
        case listButton:
            self.navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
}

extension DetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        guard currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        guard currentIndex < (pages.count - 1) else { return nil }
        return pages[currentIndex + 1]
    }
}

extension DetailPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        if let currentViewController = viewControllers?.first,
           let currentIndex = pages.firstIndex(of: currentViewController) {
            pageControl.currentPage = currentIndex
        }
    }
}
