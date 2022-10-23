//
//  ChatViewModel.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

final class ChatViewModel {
    
    // MARK: - Stored Properties
    let chatModel: ChatModel
    
    // MARK: - Actions
    let backAction: SimpleClosure
    
    // MARK: - Initializers
    init(chatModel: ChatModel, backAction: @escaping SimpleClosure) {
        self.chatModel = chatModel
        self.backAction = backAction
    }
}
