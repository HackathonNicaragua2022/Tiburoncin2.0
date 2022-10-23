//
//  MessageViewModel.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

final class MessageViewModel {
    
    // MARK: - Stored Properties
    let chatAction: ChatClosure
    
    // MARK: - Initializers
    init(chatAction: @escaping ChatClosure) {
        self.chatAction = chatAction
    }
}
