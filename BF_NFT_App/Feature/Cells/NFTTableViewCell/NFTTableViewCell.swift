//
//  NFTTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 09/06/23.
//

import UIKit
import AlamofireImage
class NFTTableViewCell: UITableViewCell {
    
    static let identifier : String = String(describing: NFTTableViewCell.self)
    
    lazy var ScreenCell : NFTTableViewCellScreen = {
        let screen = NFTTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }( )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElementes(){
        contentView.addSubview(ScreenCell)
    }
    
    public func configContraints(){
        NSLayoutConstraint.activate([
            ScreenCell.topAnchor.constraint(equalTo: topAnchor),
            ScreenCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            ScreenCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            ScreenCell.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    public func setupData(data: Nft){
        if let urlNft : URL = URL(string: data.nftImage ?? ""), let urlUser : URL = URL(string: data.userImage ?? ""){
            ScreenCell.nftImageView.af.setImage(withURL: urlNft, placeholderImage: UIImage (named:"threeButtons"))
            ScreenCell.nftImageView.backgroundColor = .white
             
            ScreenCell.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName:"person.circle.fill")?.withTintColor (.black))
            ScreenCell.userImageView.backgroundColor = .white
        }

        ScreenCell.priceLabel.text = data.price ?? ""
        ScreenCell.priceValueLabel.text = "\(data.nftPrice ?? 0) ETH "
        ScreenCell.ownedByPriceLabel.text = data.ownedBy ?? ""
        ScreenCell.userLabel.text = data.userName ?? ""
    }
    
    
    
}
