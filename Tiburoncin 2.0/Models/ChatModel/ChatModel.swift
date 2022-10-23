//
//  ChatModel.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

struct ChatModel {
    let name: String
    let messengerMessages: [(sentDate: Date, message: String)]
    let receiver: [(sentDate: Date, message: String)]
}

fileprivate let messengerMessages = [(sentDate: Date(), message: "Hola"), (sentDate: Date().addingTimeInterval(20), message: "Bien, y tu?")]
fileprivate let receiver = [(sentDate: Date().addingTimeInterval(10), message: "Hola, como estas?"), (sentDate: Date().addingTimeInterval(30), message: "Tambien estoy bien")]
let messages = [ChatModel(name: "Vladimir", messengerMessages: messengerMessages, receiver: receiver), ChatModel(name: "Sherly", messengerMessages: messengerMessages, receiver: receiver), ChatModel(name: "Maxihu", messengerMessages: messengerMessages, receiver: receiver), ChatModel(name: "Kenneth", messengerMessages: messengerMessages, receiver: receiver)]
