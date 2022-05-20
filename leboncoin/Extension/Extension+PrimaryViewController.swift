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
        guard let imageString = oneData.images_url.small else { return UITableViewCell() }
        
        guard let pictureUrl = URL(string: imageString) else { return UITableViewCell() }
              
        cell.listTitle.text = oneData.title
        cell.listPrice.text = String(oneData.price)
        cell.listUrgent.tintColor = setUrgentColor(isUrgent: oneData.is_urgent)
        cell.listCategory.image = setCategoryImage(categoryId: oneData.category_id)
        
        getData(from: pictureUrl) { data, response, error in
            guard let data = data, error == nil else { return }
            
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                    cell.listImageView.image = UIImage(data: data)
            }
        }
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
