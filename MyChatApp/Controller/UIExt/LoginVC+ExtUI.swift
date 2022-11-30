//
//  ChatVC+ExtUI.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit

extension LoginVC {
    
    func configureLoginVCUI() {
        view.backgroundColor = UIColor(named: "BrandBlue")
        configureEmailTextField()
        configurePasswordTextField()
        configureloginButton()
        configureErrorLabel()
    }
    
    func configureEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Login"
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray3])
        emailTextField.layer.cornerRadius = 25
        emailTextField.keyboardType = .emailAddress
        emailTextField.backgroundColor = .white
        emailTextField.textAlignment = .center
        emailTextField.textColor = .systemBlue
        emailTextField.layer.shadowRadius = 5
        emailTextField.layer.shadowOpacity = 1
        emailTextField.layer.shadowColor = UIColor.systemGray2.cgColor
        emailTextField.layer.shadowOffset = CGSize(width: -10.0, height: 10.0)
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
    }
    
    func configurePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray3])
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.backgroundColor = .white
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = .systemBlue
        passwordTextField.layer.shadowRadius = 5
        passwordTextField.layer.shadowOpacity = 1
        passwordTextField.layer.shadowColor = UIColor.systemGray2.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: -10.0, height: 10.0)
        passwordTextField.isSecureTextEntry = true
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ])
    }
    
    func configureloginButton() {
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        loginButton.setTitleColor(.white, for: .normal)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
        ])
    }
    
    func configureErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = ""
        errorLabel.font = .systemFont(ofSize: 15, weight: .regular)
        errorLabel.textColor = .systemGray3
        errorLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30)
        ])
    }
}
