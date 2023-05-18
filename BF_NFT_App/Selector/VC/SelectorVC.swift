//
//  SelectorVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 18/05/23.
//

import UIKit

class SelectorVC: UIViewController {

    var selectorScreen : SelectorScreen?
    
    override func loadView() {
        selectorScreen = SelectorScreen()
        view = selectorScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectorScreen?.delegate(delegate: self)

    }
}

extension SelectorVC : SelectorScreenProtocol {
    func tappedMackBookButton() {
        print(#function)
        NotificationCenter.default.post(name: Notification.Name("Macbook"), object: UIColor.blue)
        dismiss(animated: true)
    }
    
    func tappedIMackButton() {
        print(#function)
        NotificationCenter.default.post(name: Notification.Name("Imac"), object: UIColor.green)
        dismiss(animated: true)
    }
    
    
}
