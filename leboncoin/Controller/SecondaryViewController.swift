//
//  SecondaryViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 17/05/2022.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    // MARK: - Properties
    var addChoosen: OneAd?
    private var oneAddView: OneAddView =  OneAddView()
    
    // MARK: - Override
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .orange
        navigationItem.title = "Détails"
        self.setupSubviews()
    }
   
    // MARK: - Methods
    
    private func setupSubviews() {
        view.addSubview(oneAddView.addId)
        view.addSubview(oneAddView.addTitle)
        view.addSubview(oneAddView.addImageView)
        view.addSubview(oneAddView.addCategory)
        view.addSubview(oneAddView.addDate)
        view.addSubview(oneAddView.addUrgent)
        view.addSubview(oneAddView.addDescription)
        view.addSubview(oneAddView.addSiret)
    }
    
    func showAdDetails(_ adSelected: OneAd) {
        oneAddView.addId.text = String(adSelected.id)
        oneAddView.addTitle.text = adSelected.title
        oneAddView.addCategory.image = setCategoryImage(categoryId: adSelected.category_id)
        oneAddView.addDate.text = transformDate(dateString:  adSelected.creation_date)
        oneAddView.addUrgent.tintColor = setUrentColor(isUrgent: adSelected.is_urgent)
        oneAddView.addSiret.text = adSelected.siret
        oneAddView.addDescription.text = adSelected.description
        
    }
    
    private func setUrentColor(isUrgent: Bool) -> UIColor {
        var color : UIColor
        if isUrgent == true {
            color = .orange
        } else {
            color = view.backgroundColor ?? .white
        }
        return color
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
