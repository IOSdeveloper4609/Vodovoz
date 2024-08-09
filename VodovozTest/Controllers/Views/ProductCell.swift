//
//  ProductCell.swift
//  VodovozTest
//
//  Created by Азат on 08.08.2024.
//

import UIKit

final class ProductCell: BaseCell {
    
    private let imageView = UIImageView()
    private let addFavourite = UIButton()
    private let addBusket = UIButton()
    private let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 4
        contentView.layer.masksToBounds = false
    }
        
    func configure(with product: Product) {
        let priceText = "\(product.extendedPrice.first?.price ?? 0)"
        
        let boldFont = UIFont.systemFont(ofSize: 14, weight: .heavy)
        let normalFont = UIFont.systemFont(ofSize: 13)
        
        let attributedString = NSMutableAttributedString(
            string: "\(priceText) ₽",
            attributes: [NSAttributedString.Key.font: normalFont]
        )
        
        let boldTextRange = NSRange(location: 0, length: priceText.count)
        attributedString.addAttributes(
            [NSAttributedString.Key.font: boldFont],
            range: boldTextRange
        )
        
        priceLabel.attributedText = attributedString
    
        if let relativePath = product.detailPicture,
           let url = URL(string: Constants.baseURL + relativePath) {
            imageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholder"),
                options: [.transition(.fade(0.2))]
            )
        } else {
            imageView.image = nil
        }
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
    
        addFavourite.setImage(UIImage(named: "heart"), for: .normal)
        addBusket.setImage(UIImage(named: "add"), for: .normal)
        
        contentView.addSubview(addFavourite)
        contentView.addSubview(imageView)
        contentView.addSubview(addBusket)
        contentView.addSubview(priceLabel)
    }
    
    private func setupConstraints() {
        addFavourite.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        addBusket.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addFavourite.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            addFavourite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addFavourite.heightAnchor.constraint(equalToConstant: 20),
            addFavourite.widthAnchor.constraint(equalToConstant: 20),
            
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            addBusket.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            addBusket.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            addBusket.widthAnchor.constraint(equalToConstant: 30),
            addBusket.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}


