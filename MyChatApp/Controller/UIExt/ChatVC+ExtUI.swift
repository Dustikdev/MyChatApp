//
//  ChatVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit
import Firebase

extension ChatVC {
    
    func configureChatVCUI() {
        view.backgroundColor = UIColor(named: Constants.Colors.brandPurple)
        configureNavigationBar()
        configureChatTableView()
        configureBottomView()
        configureSendButton()
        configureChatTextField()
    }
    
    func configureBottomView() {
        view.addSubview(bottomView)
        bottomView.backgroundColor = UIColor(named: Constants.Colors.brandPurple)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraint = bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomConstraint,
            bottomView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    func configureSendButton() {
        bottomView.addSubview(sendButton)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.tintColor = .white
        sendButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        NSLayoutConstraint.activate([
            sendButton.heightAnchor.constraint(equalToConstant: 44),
            sendButton.widthAnchor.constraint(equalToConstant: 44),
            sendButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10),
            sendButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -15)
        ])
    }
    
    func configureChatTextField() {
        bottomView.addSubview(chatTextField)
        chatTextField.translatesAutoresizingMaskIntoConstraints = false
        chatTextField.placeholder = "Write a message..."
        chatTextField.layer.cornerRadius = 8
        chatTextField.backgroundColor = .white
        chatTextField.textAlignment = .left
        chatTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 10)
        NSLayoutConstraint.activate([
            chatTextField.heightAnchor.constraint(equalToConstant: 44),
            chatTextField.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10),
            chatTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            chatTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10)
        ])
    }
    
    func configureChatTableView() {
        view.addSubview(chatTableView)
        chatTableView.allowsSelection = false
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.contentInset.bottom = 54
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutTapped))
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor(named: Constants.Colors.brandLightBlue)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationItem.title = "MyChat"
    }
}
