//
//  ProfileVC.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 06/06/23.
//

import UIKit

class WalletVC: UIViewController {

    private var Screen : WalletScreen?
    private var viewModel : WalletViewModel = WalletViewModel()
    
    override func loadView() {
        Screen = WalletScreen()
        view = Screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}
