//
//  ViewController.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 17/05/23.
//

import UIKit

class LoginVC: UIViewController {

    var loginScreen : LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(assinatura: self)
    }
}

extension LoginVC : loginScreenProcotol {
    func tappedRPMButton() {
        print("Cheguei na VC")
    }
    
    func tappedLoginButton() {
        print("Cheguei na VC")
    }
    
    
}

