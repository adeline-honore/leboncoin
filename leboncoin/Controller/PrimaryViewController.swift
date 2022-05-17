//
//  PrimaryViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 17/05/2022.
//

import UIKit

protocol PrimaryViewControllerDelegate: AnyObject {
    func didSelectAd(_ ad: OneAd)
}

class PrimaryViewController: UIViewController {
    
    // MARK: - Properties
    var dataArray: AdsStructure = AdsStructure()
    private var listService = ListService(network: Network())
    var delegate: PrimaryViewControllerDelegate?
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomCellList.self, forCellReuseIdentifier: CustomCellList.identifier)
        return view
    }()
    
    // MARK: - Override
    override func loadView() {
        self.view = UIView()
        self.setupSubviews()
        showList()
    }
    
    // MARK: - Methods
    
    private func showList() {
        
        // get all ads
        listService.getData() { result in
            switch result {
            case .success(let allAds):
                // display data
                self.updateList(allA: allAds)
            case .failure(_):
                print("error")
            }
        }
    }
    
    // update cell
    private func updateList(allA: AdsStructure) {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.dataArray = allA
            self?.tableView.reloadData()
            
            // manage emergencies
            self?.dataArray = self?.getEntireList(list: allA) ?? AdsStructure()
        }
    }
    
    private func setupSubviews() {
        self.setupTableView()
    }
    private func setupTableView() {
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        NSLayoutConstraint.activate([
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
