//
//  HomeScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 17/05/23.
//

import UIKit

protocol HomeScreenProtocol : AnyObject {
    
    func TapeedSelectorButton()
}
class HomeScreen: UIView {
    
    private weak var delegate : HomeScreenProtocol?
    
    public func delegate(delegate : HomeScreenProtocol?){
        self.delegate = delegate
    }

    lazy var SelectorButotn : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Selecionar", for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(TappedSelectorButton), for: .touchUpInside)
        return button
    }()
    
    @objc func TappedSelectorButton(_ sender: UIButton){
        delegate?.TapeedSelectorButton()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addElements()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addElements(){
        addSubview(SelectorButotn)
    }
    
    func configElements(){
        NSLayoutConstraint.activate([
            SelectorButotn.centerXAnchor.constraint(equalTo: centerXAnchor),
            SelectorButotn.centerYAnchor.constraint(equalTo: centerYAnchor),
            SelectorButotn.widthAnchor.constraint(equalToConstant: 45),
            SelectorButotn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            SelectorButotn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
        ])
    }
    

    
}
