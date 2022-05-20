//
//  OneAddView.swift
//  leboncoin
//
//  Created by HONORE Adeline on 16/05/2022.
//

import UIKit

class OneAddView: UIView {

    var addId: UILabel = {
        let idA = UILabel()
        idA.textColor = .black
        idA.font = .systemFont(ofSize: 17, weight: .bold)
        idA.textAlignment = .center
        return idA
    }()
    
    var addCategory: UIImageView = {
        let categoryA = UIImageView()
        categoryA.tintColor = .black
        return categoryA
    }()
    
    var addTitle: UILabel = {
        let labelA = UILabel()
        labelA.textColor = .black
        labelA.font = .systemFont(ofSize: 17, weight: .bold)
        labelA.numberOfLines = 0
        labelA.textAlignment = .center
        return labelA
    }()
    
    var addPrice: UILabel = {
        let priceA = UILabel()
        priceA.textColor = .black
        priceA.font = .systemFont(ofSize: 14)
        return priceA
    }()
    
    var addDate: UILabel = {
        let dateA = UILabel()
        dateA.textColor = .black
        dateA.font = .systemFont(ofSize: 17, weight: .bold)
        dateA.textAlignment = .center
        return dateA
    }()
    
    var addImageView: UIImageView = {
        let imageViewL = UIImageView()
        imageViewL.image = UIImage(systemName: "folder.fill")
        imageViewL.contentMode = .scaleAspectFill
        return imageViewL
    }()
    
    var addUrgent: UIImageView = {
        let urgentA = UIImageView()
        urgentA.image = UIImage(systemName: "star.fill")
        return urgentA
    }()
    
    var addDescription: UILabel = {
        let descA = UILabel()
        descA.textColor = .black
        descA.font = .systemFont(ofSize: 17, weight: .bold)
        descA.numberOfLines = 0
        descA.textAlignment = .center
        descA.sizeToFit()
        return descA
    }()
    
    
    var addSiret: UILabel = {
        let siretA = UILabel()
        siretA.textColor = .black
        siretA.font = .systemFont(ofSize: 17, weight: .bold)
        siretA.numberOfLines = 0
        return siretA
    }()

}
