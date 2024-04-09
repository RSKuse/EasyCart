//
//  ShoppingCartCells.swift
//  EasyCart
//
//  Created by Reuben Simphiwe Kuse on 2024/04/07.
//

import Foundation
import UIKit

class ShoppingCartCells: UITableViewCell {
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "makeup_sponges_closed")
        //imageView.isHidden = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var storeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "CASSIE KIDS"
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = UIColor.systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel, storeNameLabel])
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.5
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "R0.00"
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        //backgroundColor = .systemRed
        setupUI()
    }
    
    func setupUI() {
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(storeNameLabel)
        addSubview(labelStackView)
        addSubview(productPriceLabel)
        
        productImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        productImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        productPriceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        labelStackView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 12).isActive = true
        labelStackView.rightAnchor.constraint(equalTo: productPriceLabel.leftAnchor, constant: 16).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
        labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        
        productPriceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        productPriceLabel.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor).isActive = true

        
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
