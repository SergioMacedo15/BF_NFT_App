//
//  LastetDealTableViewCellScrenn.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 11/06/23.
//

import UIKit

class LastetDealTableViewCellScrenn: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont (ofSize: 24)
        return label
    }()
    
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        //MARK: REGISTER MISSING
        tv.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tv.separatorStyle = .none
        tv.isScrollEnabled = false
        return tv
    }()
    
    public func configTableViewdelegate(datasource: UITableViewDataSource, delegate : UITableViewDelegate){
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor (red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint (equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint (equalTo: leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint (equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tableView.trailingAnchor.constraint (equalTo: trailingAnchor, constant: -24)
        ])
    }

}
