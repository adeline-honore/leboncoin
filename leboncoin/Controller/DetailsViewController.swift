//
//  DetailsViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var oneAddView: OneAddView =  OneAddView()
    var addChoosen: OneAd?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "Details de l'annonce"
    }
}
