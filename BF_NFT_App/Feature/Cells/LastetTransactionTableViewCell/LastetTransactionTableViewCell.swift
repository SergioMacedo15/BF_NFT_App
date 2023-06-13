//
//  LastedTransactionTableViewCell.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 12/06/23.
//

import UIKit

class LastetTransactionTableViewCell: UITableViewCell {

    static var identifier : String = String(describing: LastetTransactionTableViewCell.self)
    private var viewModel : LastetTransactionTableViewCellViewModel = LastetTransactionTableViewCellViewModel()
    
    
    lazy var Screen : LastetTransactionTableViewCellScreen = {
        let view = LastetTransactionTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElementes()
        configContraints()
        Screen.configTableViewProtocols(delegate: self, dataSource: self)
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
    
    public func setupCell(data: LatestTransactionsCell){
        viewModel.setLastTransactionData(listOfTransactions: data.listOfTransactions ?? [])
        Screen.titleLabel.text = data.latestTransactionsTitle
    }

}

extension LastetTransactionTableViewCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTransactionTableViewCell.identifier, for: indexPath) as? ListTransactionTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentTransaction(indexPath: indexPath), isInitial: viewModel.isInitial(indexPath), isFinal:viewModel.isFinal(indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt
    }
    
    
}
