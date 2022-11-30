//
//  RegisterVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit
import Firebase


class RegisterVC: UIViewController {
   
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let registerButton = UIButton()
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterVCUI()

    }
    
    @objc func registerButtonTapped() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error {
                    self.errorLabel.text = err.localizedDescription
                } else {
                    let vc = ChatVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
}
