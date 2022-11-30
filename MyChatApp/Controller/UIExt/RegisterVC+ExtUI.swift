//
//  RegisterVC+ExtUI.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit


extension RegisterVC {
    
    func configureRegisterVCUI() {
        view.backgroundColor = UIColor(named: "BrandLightBlue")
        configureEmailTextField()
        configurePasswordTextField()
        configureRegisterButton()
        configureErrorLabel()
    }
    
    func configureEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.layer.cornerRadius = 25
        emailTextField.backgroundColor = .white
        emailTextField.textAlignment = .center
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
        passwordTextField.layer.cornerRadius = 25
        passwordTextField.backgroundColor = .white
        passwordTextField.textAlignment = .center
        passwordTextField.layer.shadowRadius = 5
        passwordTextField.layer.shadowOpacity = 1
        passwordTextField.layer.shadowColor = UIColor.systemGray2.cgColor
        passwordTextField.layer.shadowOffset = CGSize(width: -10.0, height: 10.0)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRegisterButton() {
        view.addSubview(registerButton)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        registerButton.setTitleColor(.systemBlue, for: .normal)
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30)
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
            errorLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30)
        ])
    }
}
