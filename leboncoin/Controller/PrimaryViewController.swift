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
    var allData: AdsStructure = AdsStructure()
    private var listService = ListService(network: Network())
    var delegate: PrimaryViewControllerDelegate?
    var buttons: [UIButton] = [UIButton]()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomCellList.self, forCellReuseIdentifier: CustomCellList.identifier)
        return view
    }()
    
    var scrollView: UIScrollView!
    var colorView: UIView!
    
    // MARK: - Override
    override func loadView() {
        self.view = UIView()
        navigationItem.title = "Liste"
        self.setupSubviews()
        showList()
        
        colorView = UIView()
        scrollView = UIScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Catégories",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(setCategoriesButton))
    }
    
    // MARK: - Methods
    
    private func showList() {
        
        // get all ads
        listService.getData() { result in
            switch result {
            case .success(let allAds):
                // display data
                self.updateList(allA: allAds)
            case .failure(let error):
                let element = error as! ErrorType
                self.errorMessage(element: element)
            }
        }
    }
    
    // update cell
    private func updateList(allA: AdsStructure) {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.allData = allA
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
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}



extension PrimaryViewController: UIScrollViewDelegate {
    
    @objc func setCategoriesButton() {

            let categoryOptions = ["Véhicule", "Mode", "Bricolage", "Maison", "Loisirs", "Immobilier", "Livres/CD/DVD", "Multimédia", "Service", "Animaux", "Enfants", "Tout voir"]
        
            scrollView.frame = CGRect(x: UIScreen.main.bounds.width - 70,
                                      y: 20,
                                      width: UIScreen.main.bounds.width / 2.0,
                                      height: UIScreen.main.bounds.height / 2.0)
        
            scrollView.delegate = self
            scrollView.isScrollEnabled = true

            let buttonHeight: CGFloat = UIScreen.main.bounds.height / 15
            let contentHeight: CGFloat = CGFloat(categoryOptions.count) * buttonHeight
            colorView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: scrollView.frame.width,
                                     height: contentHeight)
        
            colorView.layer.cornerRadius = 10
            colorView.clipsToBounds = true
            colorView.isUserInteractionEnabled = false

            scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width / 2.0, height: contentHeight)

        
            for (index, title) in categoryOptions.enumerated() {
                let button = UIButton(type: .custom)
                
                let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.maxY
                
                button.backgroundColor = .lightGray
                button.frame = CGRect(x: UIScreen.main.bounds.width / 2.0,
                                      y: navigationBarHeight + (buttonHeight * CGFloat(index)),
                                      width: UIScreen.main.bounds.width / 2.0,
                                      height: buttonHeight)
                button.setTitle(title, for: .normal)
                view.addSubview(button)
                
                button.addTarget(self, action: #selector(filterCategories), for: .touchUpInside)
                buttons.append(button)
                button.isHidden = false
            }

            scrollView.addSubview(colorView)
            view.addSubview(scrollView)
        }
    
    @objc func filterCategories(_ sender: UIButton) {
                
        guard let idString = sender.titleLabel?.text  else {
            return
        }
        
        var id: Int = 0
        
        switch idString {
        case "Véhicule":
            id = 1
        case "Mode":
            id = 2
        case "Bricolage":
            id = 3
        case "Maison":
            id = 4
        case "Loisirs":
            id = 5
        case "Immobilier":
            id = 6
        case "Livres/CD/DVD":
            id = 7
        case "Multimédia":
            id = 8
        case "Service":
            id = 9
        case "Animaux":
            id = 10
        case "Enfants":
            id = 11
        default:
            break
        }
        
        if (sender.titleLabel?.text != "Tout voir") {
            dataArray = getOnlyOneCategory(categoryChoosen: id, entireDictionnary: allData)
        } else {
            dataArray = getAllAds(entireDictionnary: allData)
        }
        self.tableView.reloadData()
        
        buttons.forEach { buttonElement in
            buttonElement.isHidden = true
        }
    }
}
