//
//  LoginVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let errorLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoginVCUI()

    }
    
    @objc func loginButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if let err = error {
                    strongSelf.errorLabel.text = err.localizedDescription
                } else {
                    let vc = ChatVC()
                    strongSelf.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
