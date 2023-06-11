//
//  DetailsVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 06/06/23.
//

import UIKit

class DetailsVC: UIViewController {
    
    private var viewModel : DetailsViewModel = DetailsViewModel()
    private var screen : DetailsScreen?
    
    required init(nft: Nft) {
        viewModel.setDetailsNFT(data: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = DetailsScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewDelegate(delegate: self, datasource: self)
    }
}

extension DetailsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.selectCell(indexPath: indexPath, tableView: tableView, delegate: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRowAt(indexPath: indexPath)
    }
}

extension DetailsVC: NftImageTableViewCellScreenProtocol{
    func tappedCloseButton() {
        self.dismiss(animated: true)
    }
    
    func tappedmagnifyingGlassButton() {
        
    }
    
    
}
