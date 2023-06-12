//
//  LastetDealTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 11/06/23.
//

import UIKit

class LastetDealTableViewCell: UITableViewCell {

    static var identifier : String = String(describing: LastetDealTableViewCell.self)
    private var viewModel : LastetDealTableViewCellViewModel = LastetDealTableViewCellViewModel()
    
    lazy var Screen : LastetDealTableViewCellScrenn = {
        let view = LastetDealTableViewCellScrenn()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElementes()
        configContraints()
        Screen.configTableViewdelegate(datasource: self, delegate: self)
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
    
    public func setupCell(data: Nft){
        viewModel.setNfT(data: data)
        Screen.titleLabel.text = viewModel.getNft?.titleLatestDeals ?? ""
    }
}

extension LastetDealTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heigthForRowAt
    }
    
    
    
}
