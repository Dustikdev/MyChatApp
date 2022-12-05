//
//  OutgoingMessageCell.swift
//  MyChatApp
//
//  Created by Никита Швец on 01.12.2022.
//

import UIKit

class OutgoingMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let messageView = UIView()
    let avatarImageView = UIImageView()
    let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.CellIdentificators.OutgoingMessageCell)
        configureOutgoingMessageCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageView.layer.cornerRadius = frame.size.height / 5
    }
}

//MARK: - configureUI

extension OutgoingMessageCell {
    
    func configureOutgoingMessageCellUI() {
        configureMessageView()
        configureMessageLabel()
        configureAvatarImageView()
        configureStackView()
    }
    
    func configureMessageView() {
        messageView.backgroundColor = UIColor(named: Constants.Colors.brandPurple)
    }
    
    func configureMessageLabel() {
        messageView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "sdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfsdf"
        messageLabel.textAlignment = .left
        messageLabel.font = .systemFont(ofSize: 15, weight: .regular)
        messageLabel.textColor = UIColor(named: Constants.Colors.brandLightBlue)
        messageLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -10),
            messageLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 10),
            messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -10)
        ])
    }
    
    func configureAvatarImageView() {
        avatarImageView.image = UIImage(named: Constants.Images.meAvatar)
        avatarImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .top
        stackView.spacing = 20
        stackView.addArrangedSubview(messageView)
        stackView.addArrangedSubview(avatarImageView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
}
