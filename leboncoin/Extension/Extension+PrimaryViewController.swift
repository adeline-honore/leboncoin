//
//  Extension+PrimaryViewController.swift
//  leboncoin
//
//  Created by HONORE Adeline on 18/05/2022.
//

import UIKit


extension PrimaryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellList.identifier, for: indexPath) as? CustomCellList else {
            return UITableViewCell()
        }
        
        let oneData = dataArray[indexPath.row]
        guard let imageDataURL = oneData.images_url.small else {
            return CustomCellList()
        }
                
        cell.listTitle.text = oneData.title
        cell.listPrice.text = String(oneData.price)
        cell.listUrgent.tintColor = setUrgentColor(isUrgent: oneData.is_urgent)
        cell.listCategory.image = setCategoryImage(categoryId: oneData.category_id)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let adSelectRow = dataArray[indexPath.row]
        self.delegate?.didSelectAd(adSelectRow)
    }
    
}
