//
//  SelectorScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 18/05/23.
//

import UIKit

protocol SelectorScreenProtocol : AnyObject {
    func tappedMackBookButton()
    func tappedIMackButton()
}

class SelectorScreen: UIView {

    private weak var delegate : SelectorScreenProtocol?
    
    public func delegate(delegate : SelectorScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var macboobkButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "macbook")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tappedMacbookButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMacbookButton(){
        self.delegate?.tappedMackBookButton()
    }
    lazy var iMacButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Imac")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(tappedIMacButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedIMacButton(){
        self.delegate?.tappedIMackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        loadElements()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadElements(){
        addSubview(macboobkButton)
        addSubview(iMacButton)
    }
    func configElements(){
        NSLayoutConstraint.activate([
            macboobkButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            macboobkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            macboobkButton.widthAnchor.constraint(equalToConstant: 250),
            macboobkButton.heightAnchor.constraint(equalToConstant: 150),
            
            iMacButton.topAnchor.constraint(equalTo: macboobkButton.bottomAnchor, constant: 100),
            iMacButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            iMacButton.widthAnchor.constraint(equalToConstant: 250),
            iMacButton.heightAnchor.constraint(equalToConstant: 150),
        ])
    }

}
