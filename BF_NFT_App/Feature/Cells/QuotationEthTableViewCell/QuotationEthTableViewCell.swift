//
//  QuotationEthTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit
import AlamofireImage

class QuotationEthTableViewCell: UITableViewCell {

    static var identifier : String = String(describing: QuotationEthTableViewCell.self)
    
    lazy var Screen : QuotationEthTableViewCellScreen = {
        let view = QuotationEthTableViewCellScreen()
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
        contentView.addSubview(Screen)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            Screen.topAnchor.constraint(equalTo: topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: QuotationEthereum){
         Screen.coinEthImageView.image = UIImage(named: "coin.ethereum")
        Screen.ethValueLabel.text = "\(data.ethValue ?? 0) ETH"
        Screen.ethValueInDollarsLabel.text = "$ \(data.valueInDollars ?? 0)"
    }

}
