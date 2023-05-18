//
//  HomeVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 17/05/23.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen : HomeScreen?
    
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate(delegate: self)
        configObserver()
    }
    
    func configObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(UpdateImac(notification:)), name: Notification.Name("Imac"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UpdateMacbook(notification:)), name: Notification.Name("Macbook"), object: nil)
    }
    
    @objc func UpdateImac(notification: NSNotification){
        view.backgroundColor = notification.object as? UIColor
    }
    @objc func UpdateMacbook(notification: NSNotification){
        view.backgroundColor = notification.object as? UIColor
    }

}

extension HomeVC : HomeScreenProtocol{
    func TapeedSelectorButton() {
        let vc = SelectorVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
