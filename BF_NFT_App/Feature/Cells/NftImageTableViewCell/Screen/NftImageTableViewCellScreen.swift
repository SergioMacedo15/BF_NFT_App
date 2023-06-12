//
//  NftImageTableViewCellScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 10/06/23.
//

import UIKit

protocol NftImageTableViewCellScreenProtocol : AnyObject {
    func tappedCloseButton()
    func tappedmagnifyingGlassButton()
}

class NftImageTableViewCellScreen: UIView {

    private weak var delegate :NftImageTableViewCellScreenProtocol?
    
    public func delegate(delegate : NftImageTableViewCellScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var nftImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.tintColor = .white
        return image
    }()
    
    lazy var CloseButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor (red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.tintColor =  .white
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedCloseButton(){
        delegate?.tappedCloseButton()
    }
    
    lazy var magnifyingGlassButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor (red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.tintColor =  .white
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.addTarget(self, action: #selector(tappedmagnifyingGlassButton), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedmagnifyingGlassButton(){
        delegate?.tappedmagnifyingGlassButton()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementes()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementes(){
        addSubview(nftImageView)
        addSubview(CloseButton)
        addSubview(magnifyingGlassButton)
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint (equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo:leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint (equalTo: bottomAnchor) ,
            
            CloseButton.topAnchor.constraint (equalTo: nftImageView.topAnchor, constant: 30),
            CloseButton.trailingAnchor.constraint(equalTo:nftImageView.trailingAnchor,constant:-20),
            CloseButton.heightAnchor.constraint (equalToConstant: 35),
            CloseButton.widthAnchor.constraint(equalToConstant:35),
            
            magnifyingGlassButton.bottomAnchor.constraint(equalTo:nftImageView.bottomAnchor,constant:-30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo:nftImageView.trailingAnchor,constant:-20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant:35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant:35),
        
        ])
    }
}


