//
//  ViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 11/05/2022.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCellList.self, forCellReuseIdentifier: CustomCellList.identifier)
        return tableView
    }()
    
    private var listService = ListService(network: Network())
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .link
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        showList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - IBAction
    

    // MARK: - Methods
    
    @objc func getDetails() {
        let detailsVC = DetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
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
    
    // mise a jour de la cell
    private func updateList(allA: AdsStructure) {
        
    }
    
}

// MARK: - Extension
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellList.identifier, for: indexPath) as? CustomCellList else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "hello"
        cell.configure(text: "custom + \(indexPath.row+1)")
        
        cell.listButton.addTarget(self, action: #selector(getDetails), for: .touchUpInside)
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
