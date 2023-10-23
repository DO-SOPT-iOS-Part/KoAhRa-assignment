//
//  DetailPageViewController.swift
//  AppleWeather
//
//  Created by 고아라 on 2023/10/23.
//

import UIKit

final class DetailPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    var initialPage = 0
    private var pages = [UIViewController]()
    private var weatherEntity : [WeatherEntity] = WeatherEntity.mainEntityDummy()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPage()
        setUI()
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
    }
    
    func setUI() {
        self.dataSource = self
        self.setViewControllers([pages[initialPage]], direction: .forward, animated: true)
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
