//
//  ListTransactionTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 13/06/23.
//

import UIKit

class ListTransactionTableViewCell: UITableViewCell {

    static var identifier : String = String(describing: ListTransactionTableViewCell.self)
    
    lazy var Screen : ListTransactionTableViewCellScreen = {
        let view = ListTransactionTableViewCellScreen()
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
            Screen.topAnchor.constraint(equalTo: topAnchor),
            Screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            Screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            Screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: ListOfTransaction, isInitial: Bool, isFinal: Bool){
       
        Screen.idTransactionLabel.text = "\(data.idTransaction ?? "" )"
        Screen.dateEndHourLabel.text = data.dateAndHour
        Screen.priceEthLabel.text = "\(data.priceEth ?? 0) EHT "
        Screen.transactionImageView.image = UIImage(named: data.image ?? " ")
        Screen.valueInDollarLabel.text = "$ \(data.valueDollar ?? 0)"
        
        Screen.layer.borderColor = UIColor.white.cgColor
        Screen.layer.borderWidth = 0.5
        
        if data.type == "exit" {
            Screen.priceEthLabel.text = "-\(data.priceEth ?? 0) ETH"
            Screen.priceEthLabel.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1)
            Screen.valueInDollarLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
            Screen.dateEndHourLabel.textColor = UIColor(red: 122/255, green: 235/255, blue: 255/255, alpha: 1)
        } else {
            Screen.priceEthLabel.text = "+\(data.priceEth ?? 0) ETH"
            Screen.priceEthLabel.textColor = UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
            Screen.valueInDollarLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
            Screen.dateEndHourLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        }
        
        
        if isInitial {
            Screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        } else if isFinal{
            Screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
}
