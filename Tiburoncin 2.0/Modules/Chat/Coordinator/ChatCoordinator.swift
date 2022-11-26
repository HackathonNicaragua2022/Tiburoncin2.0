//
//  ChatCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class ChatCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToChatsView()
    }
}

// MARK: - Navigation
extension ChatCoordinator {
    private
    func navigateToChatsView() {
        let viewModel = ChatsViewModel()
        let controller = ChatsViewController(viewModel: viewModel)
        navigation.setViewControllers([controller], animated: true)
    }
}
