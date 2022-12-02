//
//  ChatVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
    
    let chatTableView = UITableView()
    let chatTextField = UITextField()
    let sendButton = UIButton()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hey", direction: .ingoing),
        Message(sender: "1@3.com", body: "hello", direction: .outgoing),
        Message(sender: "1@2.com", body: "bye", direction: .ingoing)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChatVCUI()
        chatTableView.allowsSelection = false
        chatTableView.register(IngoingMessageCell.self, forCellReuseIdentifier: Constants.IngoingMessageCell)
        chatTableView.register(OutgoingMessageCell.self, forCellReuseIdentifier: Constants.OutgoingMessageCell)
        chatTableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @objc func logOutTapped() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}

extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch messages[indexPath.row].direction {
        case .ingoing:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IngoingMessageCell) as! IngoingMessageCell
            cell.messageLabel.text = messages[indexPath.row].body
//            cell.senderLabel.text = messages[indexPath.row].sender
            return cell
        case .outgoing:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.IngoingMessageCell) as! OutgoingMessageCell
            cell.messageLabel.text = messages[indexPath.row].body
//            cell.senderLabel.text = messages[indexPath.row].sender
            return cell
        }

    }
    
    
    
}
