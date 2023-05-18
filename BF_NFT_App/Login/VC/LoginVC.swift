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
        loginScreen?.delegateTextField(delegate: self)
    }
}

extension LoginVC : loginScreenProcotol {
    func tappedMetaMaskButton() {
        print("Cheguei na VC")
    }
    
    func tappedRPMButton() {
        print("Cheguei na VC")
    }
    
    func tappedLoginButton() {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    
}

