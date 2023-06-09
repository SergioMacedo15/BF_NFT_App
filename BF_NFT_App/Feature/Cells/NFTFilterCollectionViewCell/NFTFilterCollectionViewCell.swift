//
//  NFTFilterCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 09/06/23.
//

import UIKit

class NFTFilterCollectionViewCell: UICollectionViewCell {
 
    static let identifier : String = String(describing: NFTFilterCollectionViewCell.self)

    lazy var ScreenCell : NFTFilterCollectionViewCellScreen = {
        let screen = NFTFilterCollectionViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }( )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElementes(){
        contentView.addSubview(ScreenCell)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            ScreenCell.topAnchor.constraint(equalTo: topAnchor),
            ScreenCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            ScreenCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            ScreenCell.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    func setupDataCell(data : FilterNft){
        ScreenCell.FilterLabel.text = data.title
        if data.isSelected ?? false{
            ScreenCell.FilterLabel.backgroundColor = .purple
        } else {
            ScreenCell.FilterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
    }
    
}
