//
//  HomeScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 06/06/23.
//

import UIKit

class HomeScreen: UIView {

    lazy var viewBackground : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var logoImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    lazy var searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.clipsToBounds = true
        searchBar.placeholder = "Pesquise pelo Nome : "
        searchBar.layer.cornerRadius = 20
        return searchBar
    }( )
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        let cv = UICollectionView()
        //MARK: REGISTER MISSING
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = UIColor (red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }( )
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        //MARK: REGISTER MISSING
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor (red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tv.separatorStyle = .none
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(viewBackground)
        viewBackground.addSubview(logoImageView)
        viewBackground.addSubview(searchBar)
        viewBackground.addSubview(collectionView)
        addSubview(tableView)
    }
}
