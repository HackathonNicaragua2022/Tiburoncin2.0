//
//  MessageCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

final class MessageCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToMessageView()
    }
    
    // MARK: - Navigation
    private func navigateToMessageView() {
        let viewModel = MessageViewModel(chatAction: navigateToChat)
        let controller = MessageViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    private func navigateToChat(chatModel: ChatModel) {
        let viewModel = ChatViewModel(chatModel: chatModel, backAction: back)
        let controller = ChatViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
}
