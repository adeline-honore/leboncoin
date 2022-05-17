//
//  AdSplitViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 17/05/2022.
//

import UIKit

class AdSplitViewController: UISplitViewController, PrimaryViewControllerDelegate {
    
    // MARK: - Properties
    private var dataArry: AdsStructure = AdsStructure()
    
    var addChoosen: OneAd?
    var scrollView: UIScrollView!
    var colorView: UIView!
    private var listService = ListService(network: Network())
    private var primaryViewController: PrimaryViewController!
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewControllers()
    }
    
    // MARK: - Methods
    
    func didSelectAd(_ ad: OneAd) {
        let vc = SecondaryViewController()
        vc.showAdDetails(ad)
        self.showDetailViewController(vc, sender: nil)
    }
    
    private func loadViewControllers() {
        self.primaryViewController = PrimaryViewController()
        self.primaryViewController.delegate = self
        let navController = UINavigationController(rootViewController: self.primaryViewController)
        let detail = SecondaryViewController()
        self.viewControllers = [navController, detail]
    }
    
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}
