//
//  TabBarController.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 05/06/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view.
    }
    
    private func setupTabBar(){
        let home = UINavigationController(rootViewController: HomeVC())
        let profile = UINavigationController(rootViewController: ProfileVC())
        let details = UINavigationController(rootViewController: DetailsVC())
        
        
        setViewControllers([home, profile, details], animated: true)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        
        //MARK: ADD ICON AND TITLE
        
        guard let items = tabBar .items else { return }
        
        items[0].image = UIImage(systemName: "house")
        items[0].title = "Home"
        items[1].image = UIImage(systemName: "person.crop.circle")
        items[1].title = "Profile"
        items[2].image = UIImage(systemName: "gearshape")
        items[2].title = "Details"
        
        
    }

}
