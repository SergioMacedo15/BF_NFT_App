//
//  ListOffersTableViewCellScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit

class ListOffersTableViewCellScreen: UIView {
    
    lazy var ImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    lazy var nameUserLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    lazy var nftPriceLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.systemFont (ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var lastVizualizationLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(ImageView)
        addSubview(nameUserLabel)
        addSubview(nftPriceLabel)
        addSubview(lastVizualizationLabel )
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            ImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ImageView.heightAnchor.constraint(equalToConstant: 40),
            ImageView.widthAnchor.constraint(equalToConstant: 40),
            
            nameUserLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameUserLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 12),
            
            nftPriceLabel.topAnchor.constraint(equalTo: topAnchor,constant: 18),
            nftPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            lastVizualizationLabel.topAnchor.constraint(equalTo: nftPriceLabel.bottomAnchor, constant: 5),
            lastVizualizationLabel.trailingAnchor.constraint(equalTo: nftPriceLabel.trailingAnchor)
        ])
    }
}
