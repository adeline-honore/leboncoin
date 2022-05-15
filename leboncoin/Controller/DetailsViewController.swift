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
        oneAddView.addDate.text = addChoosen.creation_date
        oneAddView.addUrgent.tintColor = setUrgentColor(isUrgent: addChoosen.is_urgent)
        oneAddView.addSiret.text = addChoosen.siret
        oneAddView.addDescription.text = addChoosen.description
    }
    
    
    
    /*
    private func setCategoryImage(categoryAdd: Int) -> UIImage {
        
        var imageCategory: UIImage = UIImage(systemName: "circle.hexagongrid.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        
        switch categoryAdd {
            case 1:
            imageCategory =  UIImage(systemName: "car.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 2:
            imageCategory = UIImage(systemName: "tshirt.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 3:
            imageCategory = UIImage(systemName: "hammer.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 4:
            imageCategory = UIImage(systemName: "house.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 5:
            imageCategory = UIImage(systemName: "puzzlepiece.extension.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 6:
            imageCategory = UIImage(systemName: "rectangle.and.paperclip") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 7:
            imageCategory = UIImage(systemName: "a.book.closed.fill.ja") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 8:
            imageCategory = UIImage(systemName: "desktopcomputer") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 9:
            imageCategory = UIImage(systemName: "person.2.wave.2.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 10:
            imageCategory = UIImage(systemName: "tortoise.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        case 11:
            imageCategory = UIImage(systemName: "") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        default:
            break
        }
        return imageCategory
    }*/
    
    
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

