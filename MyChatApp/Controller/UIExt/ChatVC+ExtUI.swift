//
//  ChatVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit

extension ChatVC {
    
    func configureChatVCUI() {
        view.backgroundColor = UIColor(named: "BrandPurple")
        configureSendButton()
        configureChatTextField()
        configureChatTableView()
        configureNavigationBar()
    }
    
    func configureSendButton() {
        view.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = .white
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        NSLayoutConstraint.activate([
            sendButton.heightAnchor.constraint(equalToConstant: 44),
            sendButton.widthAnchor.constraint(equalToConstant: 44),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    func configureChatTextField() {
        view.addSubview(chatTextField)
        chatTextField.translatesAutoresizingMaskIntoConstraints = false
        chatTextField.placeholder = "Write a message..."
        chatTextField.layer.cornerRadius = 8
        chatTextField.backgroundColor = .white
        chatTextField.textAlignment = .left
        chatTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        NSLayoutConstraint.activate([
            chatTextField.heightAnchor.constraint(equalToConstant: 44),
            chatTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            chatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chatTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10)
        ])
    }
    
    func configureChatTableView() {
        view.addSubview(chatTableView)
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: chatTextField.topAnchor, constant: -10),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutTapped))
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
