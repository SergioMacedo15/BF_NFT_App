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
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.clipsToBounds = true
        searchBar.placeholder = "Pesquise pelo Nome : "
        searchBar.layer.cornerRadius = 20
        return searchBar
    }( )
    
    public func configSearchBar(delegate: UISearchBarDelegate){
        searchBar.delegate = delegate
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        //MARK: REGISTER MISSING
        cv.register(NFTFilterCollectionViewCell.self, forCellWithReuseIdentifier: NFTFilterCollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        cv.setCollectionViewLayout(layout, animated: false)
        return cv
    }( )
    
    public func configCollectionView(delegate : UICollectionViewDelegate, datasource: UICollectionViewDataSource){
        collectionView.dataSource = datasource
        collectionView.delegate = delegate
    }
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        //MARK: REGISTER MISSING
        tv.register(NFTTableViewCell.self, forCellReuseIdentifier: NFTTableViewCell.identifier)
        tv.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tv.separatorStyle = .none
        return tv
    }()
    
    public func configTableView(delegate : UITableViewDelegate, datasource: UITableViewDataSource){
        tableView.dataSource = datasource
        tableView.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        addElementes()
        configConstraints()
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
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint (equalTo: safeAreaLayoutGuide.topAnchor),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackground.heightAnchor.constraint(equalToConstant:180),
            
            
            logoImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint (equalToConstant: 40),
            
            searchBar.topAnchor.constraint (equalTo: logoImageView.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            searchBar.trailingAnchor.constraint (equalTo: trailingAnchor, constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.topAnchor.constraint (equalTo: searchBar.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:viewBackground.bottomAnchor),
            
            tableView.topAnchor.constraint (equalTo: viewBackground.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint (equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
