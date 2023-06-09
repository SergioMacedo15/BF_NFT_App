//
//  HomeVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 05/06/23.
//

import UIKit

class HomeVC: UIViewController {

    private var Screen : HomeScreen?
    private var viewModel : HomeViewModel = HomeViewModel()
    
    
    override func loadView() {
        Screen = HomeScreen()
        view = Screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(typeFetch: .request)
        Screen?.configSearchBar(delegate: self)
    }
    
}

extension HomeVC : HomeViewModelProtocol{
    func sucess() {
        Screen?.configCollectionView(delegate: self, datasource: self)
        Screen?.configTableView(delegate: self, datasource: self)
    }
    
    func failure() {
        print(#function)
    }
    
    
}

extension HomeVC : UISearchBarDelegate {
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.collectionViewNumberOfItens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NFTFilterCollectionViewCell.identifier, for: indexPath) as? NFTFilterCollectionViewCell
        cell?.setupDataCell(data: viewModel.loadCurrentFilterNFT(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeforItemFilterNFT()
    }
    
    
}
 
