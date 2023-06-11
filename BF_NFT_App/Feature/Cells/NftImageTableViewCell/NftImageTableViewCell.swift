//
//  NftImageTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit
import AlamofireImage


class NftImageTableViewCell: UITableViewCell {
    
    static let identifier : String = String(describing: NftImageTableViewCell.self)
    
    private lazy var Screen: NftImageTableViewCellScreen = {
        let view = NftImageTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addElementes(){
        contentView.addSubview(Screen)
    }
    
    public func configContraints(){
        NSLayoutConstraint.activate([
            Screen.topAnchor.constraint(equalTo: topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(url: String, delegate: NftImageTableViewCellScreenProtocol){
        if let urlImage : URL = URL(string: url){
            Screen.nftImageView.af.setImage(withURL: urlImage)
        }else {
            Screen.nftImageView.image = UIImage(named: "threeButtons")
        }
        Screen.delegate(delegate: delegate)
        
    }
    
}




