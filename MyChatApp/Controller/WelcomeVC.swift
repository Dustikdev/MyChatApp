//
//  WelcomeVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit
import Firebase

class WelcomeVC: UIViewController {

    let chatNameLabel = UILabel()
    let registerButton = UIButton()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWelcomeVCUI()
        updateTimer()
    }
    
    func updateTimer() {
        let chatName = "MyChat"
        var appendingName = ""
        for (index, char) in chatName.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(index), repeats: false) { timer in
                appendingName.append(String(char))
                self.chatNameLabel.text = appendingName
            }
        }
    }
    
    @objc func loginButtonTapped() {
        if Auth.auth().currentUser?.email != nil {
            let vc = ChatVC()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = LoginVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func registerButtonTapped() {
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapRegister() {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}


