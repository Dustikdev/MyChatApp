//
//  WelcomeVC+ExtUI.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit

extension WelcomeVC {
    
    func configureWelcomeVCUI() {
        view.backgroundColor = .systemBackground
        configureChatNameLabel()
        configureLoginButton()
        configureRegisterButton()

    }
    
    func configureChatNameLabel() {
        view.addSubview(chatNameLabel)
        chatNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chatNameLabel.text = "MyChat"
        chatNameLabel.textColor = .systemRed
        chatNameLabel.font = .systemFont(ofSize: 50, weight: .heavy)
        chatNameLabel.textColor = .systemBlue
        NSLayoutConstraint.activate([
            chatNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .systemGreen
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .regular)
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func configureRegisterButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .systemBlue
        registerButton.alpha = 0.5
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .regular)
        registerButton.titleLabel?.textColor = .systemBlue
        NSLayoutConstraint.activate([
            registerButton.heightAnchor.constraint(equalToConstant: 60),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10)
        ])
    }

}
