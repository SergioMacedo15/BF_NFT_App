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
    func tappedMetaMaskButton()
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
    
    lazy var logoLoginScreen : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Vector (1)")
        image.contentMode = .scaleAspectFit
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
        tf.layer.borderWidth = 1.2
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        tf.backgroundColor = .darkGray.withAlphaComponent(0.8)
        tf.attributedPlaceholder = NSAttributedString(
            string: "Login",
            attributes: [NSAttributedString.Key.foregroundColor:  UIColor.white.withAlphaComponent(0.4)]
        )
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = UIColor.white
        
        return tf
    }()
    
    lazy var passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1.2
        tf.borderStyle = .roundedRect
        tf.layer.borderColor = UIColor.white.withAlphaComponent(0.8).cgColor
        tf.backgroundColor = .darkGray.withAlphaComponent(0.8)
        tf.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor:  UIColor.white.withAlphaComponent(0.4)]
        )
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textColor = UIColor.white
        
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
        let button = UIButton(type: .system)
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
        
    lazy var lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var metaMaskView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.purple.cgColor
        return view
    }()
    
    lazy var metaMaskButtonLabelContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrar com o MetaMask"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    lazy var metaMaskButtonLogoContent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var metaMaskButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedMetaMaskButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedMetaMaskButton(){
        delegate?.tappedMetaMaskButton()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadElements()
        configElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadElements(){
        addSubview(backgroundImage)
        addSubview(logoLoginScreen)
        addSubview(titleLogin)
        addSubview(descriptionLogin)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(RMPbutton)
        addSubview(LoginButton)
        addSubview(lineView)
        addSubview(metaMaskView )
        addSubview(metaMaskButton)
        metaMaskView .addSubview(metaMaskButtonLogoContent)
        metaMaskView .addSubview(metaMaskButtonLabelContent)
        
    }
    
    func configElements(){
        NSLayoutConstraint.activate([
        
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoLoginScreen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoLoginScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoLoginScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            logoLoginScreen.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoLoginScreen.heightAnchor.constraint(equalToConstant: 120),
            
            titleLogin.topAnchor.constraint(equalTo: logoLoginScreen.bottomAnchor, constant: 20),
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
            
            lineView.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 40),
            lineView.leadingAnchor.constraint(equalTo: LoginButton.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: LoginButton.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            metaMaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40),
            metaMaskView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            metaMaskView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            metaMaskView.heightAnchor.constraint(equalToConstant: 50),
            
            metaMaskButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40),
            metaMaskButton .leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            metaMaskButton .trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            metaMaskButton .heightAnchor.constraint(equalToConstant: 50),
            
            metaMaskButtonLogoContent.leadingAnchor.constraint(equalTo: metaMaskView.leadingAnchor, constant: 53),
            metaMaskButtonLogoContent.centerYAnchor.constraint(equalTo: metaMaskView.centerYAnchor),
            metaMaskButtonLogoContent.heightAnchor.constraint(equalToConstant: 25),
            metaMaskButtonLogoContent.widthAnchor.constraint(equalToConstant: 25),
            
            metaMaskButtonLabelContent.leadingAnchor.constraint(equalTo: metaMaskButtonLogoContent.trailingAnchor, constant: 20),
            metaMaskButtonLabelContent.trailingAnchor.constraint(equalTo: metaMaskView .trailingAnchor, constant: -5),
            metaMaskButtonLabelContent.centerYAnchor.constraint(equalTo: metaMaskView .centerYAnchor),
        ])
    }
    
    func delegateTextField(delegate: UITextFieldDelegate){
        self.loginTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    
}
