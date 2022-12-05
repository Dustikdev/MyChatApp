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
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChatVCUI()
        chatTableView.register(IngoingMessageCell.self, forCellReuseIdentifier: Constants.CellIdentificators.IngoingMessageCell)
        chatTableView.register(OutgoingMessageCell.self, forCellReuseIdentifier: Constants.CellIdentificators.OutgoingMessageCell)
        chatTableView.dataSource = self
        chatTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        loadMessages()
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
                            let newMessage = Message(sender: messageSender, body: mesageBody, direction: .ingoing)
//                            print(newMessage)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.chatTableView.reloadData()
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
    
    @objc func sendButtonTapped() {
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
                    self.chatTextField.endEditing(true)
                }
            }
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

//MARK: - UITableViewDataSource

extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch messages[indexPath.row].direction {
        case .ingoing:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentificators.IngoingMessageCell) as! IngoingMessageCell
            cell.messageLabel.text = messages[indexPath.row].body
            return cell
        case .outgoing:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentificators.OutgoingMessageCell) as! OutgoingMessageCell
            cell.messageLabel.text = messages[indexPath.row].body
            return cell
        }
    }
}

extension ChatVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendButtonTapped()
        textField.endEditing(true)
        return true
    }
}
