//
//  Extension+ViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 16/05/2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func setUrgentColor(isUrgent: Bool) -> UIColor {
        var color : UIColor
        if isUrgent == true {
            color = .orange
        } else {
            color = view.backgroundColor ?? .white
        }
        return color
    }
    
    func setCategoryImage(categoryId: Int) -> UIImage? {
        
        var imageCategory: UIImage = UIImage(systemName: "circle.hexagongrid.fill") ?? UIImage(systemName: "circle.hexagongrid.fill")!
        
        switch categoryId {
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
    }
    
    
    func sortByDate(list: AdsStructure) -> AdsStructure {
        return list.sorted(by: { $0.creation_date < $1.creation_date })
    }
    
    func haveUrgentAdds(list: AdsStructure) -> AdsStructure {
        var oneCategoryUrgent = AdsStructure()
        
        // first : create One with only all urgent adds
        for addElement in list{
            if addElement.is_urgent == true {
            oneCategoryUrgent.append(addElement)
            }
        }
        // then sort oneCategoryUrgent by date
        oneCategoryUrgent = sortByDate(list: oneCategoryUrgent)
        
        return oneCategoryUrgent
    }
    
    func haveNonUrgentAdds(list: AdsStructure) -> AdsStructure {
        var nonUrgent = AdsStructure()
        
        // first : create One with only all non - urgent adds
        for addElement in list {
            
            if addElement.is_urgent == false {
            nonUrgent.append(addElement)
            }
        }
        // then sort dictionnaryUrgent by date
        nonUrgent = sortByDate(list: nonUrgent)
        
        return nonUrgent
    }
    
    func getOnlyOneCategory(categoryChoosen: Int, entireDictionnary: AdsStructure) -> AdsStructure {
        var oneCategory: AdsStructure = AdsStructure()
        
        // first : create One with only one category adds
        entireDictionnary.forEach { addElement in
            if addElement.category_id == categoryChoosen {
                oneCategory.append(addElement)
            }
        }
        // then sort oneCategory by date
        oneCategory = sortByDate(list: oneCategory)
        
        return oneCategory
    }
    
    func getEntireList(list: AdsStructure) -> AdsStructure {
        let entireListStored = haveUrgentAdds(list: list) + haveNonUrgentAdds(list: list)
        return entireListStored
    }
    
    func transformDate(dateString: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        guard let date = dateFormatter.date(from: dateString) else {
            return ""
        }
        
        let french       = DateFormatter()
        french.dateStyle = .medium
        french.timeStyle = .medium
        french.locale    = Locale(identifier: "FR-fr")
        
        return french.string(from: date)
    }
}
