//
//  Message.swift
//  MyChatApp
//
//  Created by Никита Швец on 01.12.2022.
//

import Foundation

struct Message {
    let sender: String
    let body: String
    let direction: Direction
}

enum Direction {
    case ingoing
    case outgoing
}
