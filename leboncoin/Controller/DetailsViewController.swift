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
        view.backgroundColor = .white
        navigationItem.title = "Details de l'annonce"
        
        showAddDetails()
        view.addSubview(oneAddView.addId)
        view.addSubview(oneAddView.addTitle)
        view.addSubview(oneAddView.addImageView)
        view.addSubview(oneAddView.addCategory)
        view.addSubview(oneAddView.addDate)
        view.addSubview(oneAddView.addUrgent)
        view.addSubview(oneAddView.addDescription)
        view.addSubview(oneAddView.addSiret)
    }
    
    private func showAddDetails() {
        
        guard let addChoosen = addChoosen else {
            return
        }

        oneAddView.addId.text = String(addChoosen.id)
        oneAddView.addTitle.text = addChoosen.title
        oneAddView.addImageView.image = UIImage(systemName: "folder.fill")
        oneAddView.addCategory.image = setCategoryImage(categoryId: addChoosen.category_id)
        oneAddView.addDate.text = transformDate(dateString: addChoosen.creation_date)
        oneAddView.addUrgent.tintColor = setUrgentColor(isUrgent: addChoosen.is_urgent)
        oneAddView.addSiret.text = addChoosen.siret
        oneAddView.addDescription.text = addChoosen.description
    }
    
    override func viewDidLayoutSubviews() {
        
        let imageWidth: CGFloat = 105
        let imageHeight: CGFloat = 140
        
        let viewWidth = view.frame.width
        
        oneAddView.addTitle.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                           y: 90,
                                           width: viewWidth * 0.75,
                                           height: 60)
        
        oneAddView.addId.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                        y: oneAddView.addTitle.frame.minY +             oneAddView.addTitle.frame.height + 30,
                                        width: viewWidth * 0.75,
                                        height: 100)
        
        oneAddView.addImageView.frame = CGRect(x: (viewWidth - imageWidth) / 2,
                                               y: oneAddView.addId.frame.minY + oneAddView.addId.frame.height + 30,
                                               width: imageWidth,
                                               height: imageHeight)
        
        oneAddView.addCategory.frame = CGRect(x: (viewWidth - 30) / 2,
                                              y: oneAddView.addImageView.frame.minY + oneAddView.addImageView.frame.height + 30,
                                              width: 30,
                                              height: 30)
        
        oneAddView.addDate.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                          y: oneAddView.addCategory.frame.minY + oneAddView.addCategory.frame.height + 30,
                                          width: viewWidth * 0.75,
                                          height: 30)
        
        oneAddView.addUrgent.frame = CGRect(x: (viewWidth - 30) / 2,
                                            y: oneAddView.addDate.frame.minY + oneAddView.addDate.frame.height + 30,
                                            width: 30,
                                            height: 30)
        
        oneAddView.addDescription.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                                 y: oneAddView.addUrgent.frame.minY + oneAddView.addUrgent.frame.height + 30,
                                                 width: viewWidth * 0.75,
                                                 height: 700)
    }
    
}

