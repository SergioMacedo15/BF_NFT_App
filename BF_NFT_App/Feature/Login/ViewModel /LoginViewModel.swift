//
//  LoginViewModel.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 04/06/23.
//

import UIKit
import Firebase

protocol LoginViewModelProtocol: AnyObject{
    func sucessLogin()
    func errorLogin()
}

class LoginViewModel {
    
    private var delegate : LoginViewModelProtocol?
    private var auth = Auth.auth()
    
    public func delegate(delegate : LoginViewModelProtocol?){
        self.delegate = delegate
    }
    
    //MARK: VALIDAÇÃO DE DADOS DE LOGIN
    public func ValidateLoginProfile(textField : UITextField, Screen: LoginScreen){
        if textField.text?.isEmpty ?? false{
            textField.layer.borderWidth = 1.5
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField{
            case Screen.emailTextField:
                if( Screen.emailTextField.text ?? "").isValid(validType: .email){
                    Screen.emailTextField.layer.borderWidth = 1
                    Screen.emailTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    Screen.emailTextField.layer.borderWidth = 1.5
                    Screen.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
            case Screen.passwordTextField:
                if( Screen.passwordTextField.text ?? "").isValid(validType: .password){
                    Screen.passwordTextField.layer.borderWidth = 1
                    Screen.passwordTextField.layer.borderColor = UIColor.white.cgColor
                } else {
                    Screen.passwordTextField.layer.borderWidth = 1.5
                    Screen.passwordTextField.layer.borderColor = UIColor.red.cgColor
                }
            default:
                break
            }
        }
    }
    
    //MARK: HABILITAÇÃO DO BOTTÃO DE LOGIN
    public func isEnableLoginButton( Screen: LoginScreen){
        
        if( Screen.passwordTextField.text ?? "").isValid(validType: .password) &&
            (Screen.emailTextField.text ?? "").isValid(validType: .email) {
            Screen.loginButton.setTitleColor(.white, for: .normal)
            Screen.loginButton.isEnabled =  true
            Screen.subLoginImageView.alpha = 1
        } else {
            Screen.loginButton.setTitleColor(.lightGray, for: .normal)
            Screen.loginButton.isEnabled =  false
            Screen.subLoginImageView.alpha = 0.4
        }
    }
    
    //MARK: EXECUÇÃO DO LOGIN, CHAMADA DE FRANEWORK
    public func AuthLogin(Email: String, Password : String){
        auth.signIn(withEmail: Email, password: Password , completion: { Data, error in
            if error != nil {
                print("Erro")
                self.delegate?.errorLogin()
            } else {
                print("Sucess")
                self.delegate?.sucessLogin()    
            }
        })
    }
}

