//
//  ViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 11/05/2022.
//

import UIKit
/*
class ListViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCellList.self, forCellReuseIdentifier: CustomCellList.identifier)
        return tableView
    }()
    
    private var listService = ListService(network: Network())
    
    private var dataArray: AdsStructure = AdsStructure()
    
    var addChoosen: OneAd?
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .purple
        navigationItem.title = "liste"
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
    
    // mise a jour de la cell
    private func updateList(allA: AdsStructure) {
        DispatchQueue.main.async { [weak self] in
            
            self?.dataArray = allA
            self?.tableView.reloadData()
            self?.dataArray = self?.getEntireList(list: allA) ?? AdsStructure()
        }
    }
    
}

// MARK: - Extension
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellList.identifier, for: indexPath) as? CustomCellList else {
            return UITableViewCell()
        }
        
        let oneData = dataArray[indexPath.row]
        cell.listTitle.text = oneData.title
        cell.listPrice.text = String(oneData.price)
        cell.listUrgent.tintColor = setUrgentColor(isUrgent: oneData.is_urgent)
        cell.listImageView.image = UIImage(systemName: "folder.fill")
        cell.listCategory.image = setCategoryImage(categoryId: oneData.category_id)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        addChoosen = dataArray[indexPath.row]
        
        // push add datas in the next controller
        let detailsVC = DetailsViewController()
        detailsVC.addChoosen = addChoosen
        
        // Push to next view
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
*/
