//
//  CustomCellList.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import UIKit

class CustomCellList: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "customTableViewCellList"
    
    var listImageView: UIImageView = {
        let imageViewL = UIImageView()
        imageViewL.image = UIImage(systemName: "folder.fill")
        imageViewL.contentMode = .scaleAspectFill
        return imageViewL
    }()
    
    let listTitle: UILabel = {
        let titleL = UILabel()
        titleL.textColor = .black
        titleL.font = .systemFont(ofSize: 17)
        titleL.numberOfLines = 0
        return titleL
    }()
    
    var listCategory: UIImageView = {
        let categoryL = UIImageView()
        categoryL.tintColor = .black
        return categoryL
    }()
    
    var listPrice: UILabel = {
        let priceL = UILabel()
        priceL.textColor = .black
        priceL.font = .systemFont(ofSize: 14)
        return priceL
    }()
    
    var listUrgent: UIImageView = {
        let urgentL = UIImageView()
        urgentL.image = UIImage(systemName: "star.fill")
        return urgentL
    }()
    // MARK: - Override
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(listTitle)
        contentView.addSubview(listImageView)
        contentView.addSubview(listPrice)
        contentView.addSubview(listUrgent)
        contentView.addSubview(listCategory)
        
    }
    
    override func layoutSubviews() {
        
        listImageView.frame = CGRect(x: contentView.frame.size.width * 0.06,
                               y: 5,
                               width: contentView.frame.size.width * 0.05,
                                     height: contentView.frame.size.height - (contentView.frame.size.height * 0.05))
                
        listTitle.frame = CGRect(x: listImageView.frame.minX + listImageView.frame.width + (contentView.frame.size.width * 0.06),
                                 y: 5,
                                 width: contentView.frame.size.width * 0.50,
                               height: contentView.frame.size.height)
        
        listCategory.frame = CGRect(x: listTitle.frame.maxY + listTitle.frame.width + (contentView.frame.size.width * 0.04),
                               y: 5,
                               width: contentView.frame.size.width * 0.05,
                               height: contentView.frame.size.width * 0.05)
        
        listUrgent.frame = CGRect(x: listCategory.frame.minX + listCategory.frame.width + (contentView.frame.size.width * 0.04),
                               y: 5,
                               width: contentView.frame.size.width * 0.06,
                               height: contentView.frame.size.width * 0.06)
        
        listPrice.frame = CGRect(x: listUrgent.frame.minX + listUrgent.frame.width + (contentView.frame.size.width * 0.04),
                               y: 5,
                               width: contentView.frame.size.width * 0.1,
                               height: contentView.frame.size.width * 0.06)
        
    }
    
    
    // MARK: - Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
