//
//  ListOffersTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit
import AlamofireImage

class ListOffersTableViewCell: UITableViewCell {

    static var identifier : String = String(describing: ListOffersTableViewCell.self)
    
    lazy var Screen : ListOffersTableViewCellScreen = {
        let view = ListOffersTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addElementes(){
        contentView.addSubview(Screen)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            Screen.topAnchor.constraint(equalTo:  topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: LatestDeal, isInitial: Bool, isFinal : Bool){
        if let urlImage : URL = URL(string: data.userImage ?? ""){
            Screen.ImageView.af.setImage(withURL: urlImage, placeholderImage: UIImage(named: "person.circle.fill")?.withTintColor(.black))
        }
        Screen.layer.borderColor = UIColor.white.cgColor
        Screen.layer.borderWidth = 0.5
        Screen.nameUserLabel.text = data.userName
        Screen.nftPriceLabel.text = "\(data.nftPrice ?? 0 ) ETH"
        Screen.lastVizualizationLabel.text = data.lastAccess
        
        if isInitial {
            Screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        } else if isFinal{
            Screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    } 
}
