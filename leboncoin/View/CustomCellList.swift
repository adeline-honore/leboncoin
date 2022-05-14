//
//  CustomCellList.swift
//  leboncoin
//
//  Created by HONORE Adeline on 14/05/2022.
//

import UIKit

class CustomCellList: UITableViewCell {
    
    
    // MARK: - Properties
    let listTitle: UILabel = {
        let titleL = UILabel()
        titleL.textColor = .white
        titleL.font = .systemFont(ofSize: 17, weight: .bold)
        titleL.text = "cusom cell"
        return titleL
    }()
    
    static let identifier = "customTableViewCellList"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    let listButton: UIButton = {
        let cellButtonL = UIButton()
        //cellButtonL.setTitle("->", for: .normal)
        cellButtonL.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        cellButtonL.tintColor = .green
        return cellButtonL
    }()
    
    // MARK: - Override

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        listTitle.text = nil
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(listTitle)
        contentView.addSubview(listButton)
    }
    
    override func layoutSubviews() {
                
        listTitle.frame = CGRect(x: 10,
                               y: 0,
                               width: (contentView.frame.size.width) / 2,
                               height: contentView.frame.size.height)
        
        listButton.frame = CGRect(x: contentView.frame.size.width - 60,
                                  y: 5,
                                  width: 50,
                                  height: 50)
    }
    
    
    // MARK: - Methods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String) {
        listTitle.text = text
    }

}
