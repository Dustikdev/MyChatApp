//
//  TableViewCell.swift
//  MyChatApp
//
//  Created by Никита Швец on 01.12.2022.
//

import UIKit

class MessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let messageView = UIView()
    let meAvatarImageView = UIImageView()
    let youAvatarImageView = UIImageView()
    let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.CellIdentificators.MessageCell)
        configureIngoingMessageCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageView.layer.cornerRadius = frame.size.height / 5
    }

}

extension MessageCell {
    
    func configureIngoingMessageCellUI() {
        configureMessageView()
        configureMessageLabel()
        configureMeAvatarImageView()
        configureYouAvatarImageView()
        configureStackView()
    }
    
    func configureMessageView() {
        messageView.backgroundColor = UIColor(named: Constants.Colors.brandPurple)
    }
    
    func configureMessageLabel() {
        messageView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configureMeAvatarImageView() {
        meAvatarImageView.image = UIImage(named: Constants.Images.meAvatar)
        meAvatarImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            meAvatarImageView.heightAnchor.constraint(equalToConstant: 40),
            meAvatarImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureYouAvatarImageView() {
        youAvatarImageView.image = UIImage(named: Constants.Images.youAvatar)
        youAvatarImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            youAvatarImageView.heightAnchor.constraint(equalToConstant: 40),
            youAvatarImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .top
        stackView.spacing = 20
        stackView.addArrangedSubview(youAvatarImageView)
        stackView.addArrangedSubview(messageView)
        stackView.addArrangedSubview(meAvatarImageView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

