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
        configureRegisterLabel()
        configureErrorLabel()
    }
    
    func configureEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "1@2.com"
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue])
        emailTextField.layer.cornerRadius = 25
        emailTextField.backgroundColor = .white
        emailTextField.textAlignment = .center
        emailTextField.textColor = .systemBlue
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
        passwordTextField.placeholder = "123456"
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue])
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.backgroundColor = .white
        passwordTextField.textAlignment = .center
        passwordTextField.textColor = .systemBlue
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRegisterLabel() {
        view.addSubview(registerLabel)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.text = "Log In"
        registerLabel.font = .systemFont(ofSize: 25, weight: .regular)
        registerLabel.textColor = .white
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
        ])
    }
    
    func configureErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.text = "Error"
        errorLabel.font = .systemFont(ofSize: 25, weight: .regular)
        errorLabel.textColor = .white
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30)
        ])
    }
}
