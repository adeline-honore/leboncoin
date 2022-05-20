//
//  SecondaryViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 17/05/2022.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    // MARK: - Properties
    private var oneAddView: OneAddView =  OneAddView()
    
    // MARK: - Override
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
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
        view.addSubview(oneAddView.addPrice)
    }
    
    func showAdDetails(_ adSelected: OneAd) {
        
        guard let imageString = adSelected.images_url.small else { return }
        
        guard let pictureUrl = URL(string: imageString) else { return }
                
        oneAddView.addId.text = String(adSelected.id)
        oneAddView.addTitle.text = adSelected.title
        oneAddView.addCategory.image = setCategoryImage(categoryId: adSelected.category_id)
        oneAddView.addDate.text = transformDate(dateString:  adSelected.creation_date)
        oneAddView.addUrgent.tintColor = setUrentColor(isUrgent: adSelected.is_urgent)
        oneAddView.addSiret.text = adSelected.siret
        oneAddView.addDescription.text = adSelected.description
        oneAddView.addPrice.text = String(adSelected.price).replacingOccurrences(of: ".", with: " € ")
        
        getData(from: pictureUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.oneAddView.addImageView.image = UIImage(data: data)
            }
        }
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
                                        y: oneAddView.addTitle.frame.minY +             oneAddView.addTitle.frame.height + 10,
                                        width: viewWidth * 0.75,
                                        height: 100)
        
        oneAddView.addImageView.frame = CGRect(x: (viewWidth - imageWidth) / 2,
                                               y: oneAddView.addId.frame.minY + oneAddView.addId.frame.height + 10,
                                               width: imageWidth,
                                               height: imageHeight)
        
        oneAddView.addPrice.frame = CGRect(x: (viewWidth - 30) / 2,
                                              y: oneAddView.addImageView.frame.minY + oneAddView.addImageView.frame.height + 10,
                                              width: 100,
                                              height: 30)
        
        oneAddView.addCategory.frame = CGRect(x: (viewWidth - 30) / 2,
                                              y: oneAddView.addPrice.frame.minY + oneAddView.addPrice.frame.height + 10,
                                              width: 30,
                                              height: 30)
        
        oneAddView.addDate.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                          y: oneAddView.addCategory.frame.minY + oneAddView.addCategory.frame.height + 10,
                                          width: viewWidth * 0.75,
                                          height: 30)
        
        oneAddView.addUrgent.frame = CGRect(x: (viewWidth - 30) / 2,
                                            y: oneAddView.addDate.frame.minY + oneAddView.addDate.frame.height + 10,
                                            width: 30,
                                            height: 30)
        
        oneAddView.addDescription.frame = CGRect(x: (viewWidth - (viewWidth * 0.75)) / 2,
                                                 y: oneAddView.addUrgent.frame.minY + oneAddView.addUrgent.frame.height + 10,
                                                 width: viewWidth * 0.75,
                                                 height: 400)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
