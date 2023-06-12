//
//  NftDescriptionTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

class NftDescriptionTableViewCell: UITableViewCell {
    
    static var identifier : String = String(describing: NftDescriptionTableViewCell.self)
    
    lazy var Screen : NftDescriptionTableViewCellScreen = {
        let view = NftDescriptionTableViewCellScreen()
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
    
    private func addElementes(){
        addSubview(Screen)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            Screen.topAnchor.constraint(equalTo: topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    public func setupCell(id: Int, title : String, description : String){
        Screen.idLabel.text = "#\(id)"
        Screen.titleLabel.text = title
        Screen.descriptionLabel.text = description
        
        
    }
    
}
