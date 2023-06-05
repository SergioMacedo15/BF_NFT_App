//
//  TabBarController.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 05/06/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        // Do any additional setup after loading the view.
    }
    
    func configTabBar(){
        let home = UINavigationController(rootViewController: HomeVC())
        setViewControllers([home], animated: true)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        guard let items = tabBar .items else { return }
    
        items[0].image = UIImage(systemName: "trash")
        
    }

}
