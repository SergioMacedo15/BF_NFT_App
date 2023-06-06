//
//  ViewController.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 17/05/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var screen : LoginScreen?
    private var viewModel : LoginViewModel = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        screen?.delegate(delegate: self)
        viewModel.delegate(delegate: self)
        screen?.configTextFieldsDelegate(delegate: self)
    }
    
}

extension LoginVC : LoginViewModelProtocol {
    func errorLogin() {
        Alert(controller: self).showAlertInformation(title: "Error", message: "Erro de login, email e/ou senha não conferem") {
            self.screen?.passwordTextField.text = ""
        }
    }
    
    func sucessLogin() {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginVC : LoginScreenProtocol {
    func tappedMetaMaskButton() {
        print("Cheguei na VC")
    }
    
    func tappedRPMButton() {
        print("Cheguei na VC")
    }
    
    func tappedLoginButton() {
        viewModel.AuthLogin(Email: screen?.emailTextField.text ?? "" , Password: screen?.passwordTextField.text ?? "")
    }
}

extension LoginVC : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let screen = screen else {return}
        viewModel.ValidateLoginProfile(textField: textField, Screen: screen)
        viewModel.isEnableLoginButton(Screen: screen)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
}

