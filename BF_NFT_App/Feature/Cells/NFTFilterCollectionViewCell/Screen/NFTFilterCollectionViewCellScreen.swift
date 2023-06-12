//
//  NFTFilterCollectionViewCellScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 09/06/23.
//

import UIKit

class NFTFilterCollectionViewCellScreen: UIView {
    
    
    lazy var FilterLabel : UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        return label
    }()
    
//    @objc func tappedFilterLabel(){
//
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configContraints()
        
    }
    
    func addElements(){
        addSubview(FilterLabel)
    }
    
    func configContraints(){
        NSLayoutConstraint.activate([
            FilterLabel.topAnchor.constraint(equalTo: topAnchor),
            FilterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            FilterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            FilterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
