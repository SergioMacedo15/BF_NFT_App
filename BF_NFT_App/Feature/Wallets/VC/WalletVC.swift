//
//  ProfileVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 06/06/23.
//

import UIKit

class WalletVC: UIViewController {

    private var Screen : WalletScreen?
    private var viewModel : WalletViewModel = WalletViewModel()
    
    override func loadView() {
        Screen = WalletScreen()
        view = Screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchRequest(typeFetch: .request)
        viewModel.delegate(delegate: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension WalletVC : WalletViewModelProtocol {
    func sucess() {
        DispatchQueue.main.async {
            self.Screen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.Screen?.tableView.reloadData()
        }
    }
    
    func failure() {
    }
    
}

extension WalletVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.selectCell(indexPath: indexPath, tableView: tableView, delegate: self)
        return cell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    
}
