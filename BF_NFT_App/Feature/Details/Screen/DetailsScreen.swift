//
//  DetailsScreen.swift
//  BF_NFT_App
// 
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

class DetailsScreen: UIView {

    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        //MARK: REGISTER MISSING
        tv.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tv.separatorStyle = .none
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addElementes(){
        addSubview(tableView)
    }
    
    public func configContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, datasource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }
}
