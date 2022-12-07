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
    let bottomView = UIView()
    let db = Firestore.firestore()
    var bottomConstraint = NSLayoutConstraint()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChatVCUI()
        dismissKeyboard()
        chatTableView.register(MessageCell.self, forCellReuseIdentifier: Constants.CellIdentificators.MessageCell)
        chatTableView.dataSource = self
        chatTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        loadMessages()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    func loadMessages() {
        db.collection("messages").order(by: "time").addSnapshotListener { querySnapshot, error in
            self.messages = []
            if let err = error {
                print(err)
            }
            else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let mesageBody = data["body"] as? String, let messageSender = data["sender"] as? String {
                            let newMessage = Message(sender: messageSender, body: mesageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.chatTableView.reloadData()
                                self.scrollTableViewToBottom()
                            }
                        }
                    }
                }
            }
        }
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
    
    func addToFirebase() {
        if chatTextField.text != "" {
            if let messageBody = chatTextField.text, let sender = Auth.auth().currentUser?.email {
                db.collection("messages").addDocument(data:[
                    "sender" : sender,
                    "body": messageBody,
                    "time": Date().timeIntervalSince1970
                ])
                { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added successfully")
                        DispatchQueue.main.async {
                            self.chatTextField.text = ""
                        }
                    }
                }
            }
        }
    }
    
    @objc func sendButtonTapped() {
        addToFirebase()
        scrollTableViewToBottom()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomConstraint.constant = -keyboardSize.height
            bottomConstraint.isActive = true
            chatTableView.contentInset.bottom = keyboardSize.height + 30
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
                scrollTableViewToBottom()
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        bottomConstraint.constant = -20
        chatTableView.contentInset.bottom = 50
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
        scrollTableViewToBottom()
    }
    
    func scrollTableViewToBottom() {
        if messages.count > 0 {
            let last = IndexPath(row: messages.count - 1, section: 0)
            chatTableView.scrollToRow(at: last, at: .bottom, animated: false)
        }
    }

}

//MARK: - UITableViewDataSource


extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentificators.MessageCell) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        if let sender = Auth.auth().currentUser?.email {
            if messages[indexPath.row].sender == sender {
                cell.meAvatarImageView.isHidden = false
                cell.youAvatarImageView.isHidden = true
                return cell
            } else {
                cell.youAvatarImageView.isHidden = false
                cell.meAvatarImageView.isHidden = true
                cell.messageView.backgroundColor = UIColor(named: Constants.Colors.brandLightPurple)
                cell.messageLabel.textColor = UIColor(named: Constants.Colors.brandPurple)
                return cell
            }
        }
        return cell
    }
}

//MARK: - UITextFieldDelegate

extension ChatVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addToFirebase()
        scrollTableViewToBottom()
        textField.text = ""
        return true
    }
}

//MARK: - dismissKeyboard

extension ChatVC {
    
    func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
