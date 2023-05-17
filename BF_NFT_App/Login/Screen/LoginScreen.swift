//
//  LoginScreen.swift
//  BF_NFT_App
//
//  Created by Sergio Silva Macedo on 17/05/23.
//

import UIKit

protocol loginScreenProcotol: AnyObject{
    func tappedRPMButton()
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate : loginScreenProcotol?
    
    public func delegate (assinatura: loginScreenProcotol?) {
        self.delegate = assinatura
    }
    
    lazy var backgroundImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG Login 1")
        image.contentMode = .scaleToFill
        
        return image
    }()
    
    lazy var titleLogin : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BF NFT"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var descriptionLogin : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O marketing place de NFTs da BackFront Academy"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var loginTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.4
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        tf.placeholder = "Login"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = UIColor.white
        tf.backgroundColor = UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.0)
        return tf
    }()
    
    lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.4
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        tf.placeholder = "Password"
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = UIColor.white
        tf.backgroundColor = UIColor(red: 0.53, green: 0.53, blue: 0.53, alpha: 1.0)
        return tf
    }()
    
    lazy var RMPbutton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar senha?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.purple.withAlphaComponent(1.00), for: .normal)
        button.setTitleColor(.purple.withAlphaComponent(0.60), for: .highlighted)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(tappedRMPButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRMPButton(){
        print(#function)
        self.delegate?.tappedRPMButton()
    }
    
    lazy var LoginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        button.backgroundColor = .purple.withAlphaComponent(0.50)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLoginButton(){
        print(#function)
        self.delegate?.tappedLoginButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        loadElements()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadElements(){
        addSubview(backgroundImage)
        addSubview(titleLogin)
        addSubview(descriptionLogin)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(RMPbutton)
        addSubview(LoginButton)
        
    }
    
    func configElements(){
        NSLayoutConstraint.activate([
        
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            titleLogin.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLogin.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: 10),
            descriptionLogin.leadingAnchor.constraint(equalTo: titleLogin.leadingAnchor),
            descriptionLogin.trailingAnchor.constraint(equalTo: titleLogin.trailingAnchor),
            descriptionLogin.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: descriptionLogin.bottomAnchor, constant: 20),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginTextField.widthAnchor.constraint(equalToConstant: 45),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 45),

            RMPbutton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            RMPbutton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            RMPbutton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            LoginButton.topAnchor.constraint(equalTo: RMPbutton.bottomAnchor, constant: 40),
            LoginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            LoginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            LoginButton.heightAnchor.constraint(equalToConstant: 45),
            
    
            
        
        ])
    }
    
    
}
