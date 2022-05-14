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
    
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .link
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
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
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
