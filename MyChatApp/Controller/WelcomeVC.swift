//
//  WelcomeVC.swift
//  MyChatApp
//
//  Created by Никита Швец on 23.11.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    let chatNameLabel = UILabel()
    let registerButton = UIButton()
    let loginButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWelcomeVCUI()
    }
    
    @objc private func loginButtonTapped() {
        let vc = LoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}
