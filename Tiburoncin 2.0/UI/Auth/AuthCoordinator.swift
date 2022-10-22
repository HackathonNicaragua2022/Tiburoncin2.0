//
//  AuthCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToAuth()
    }
    
    // MARK: - Navigation
    private func navigateToAuth() {
        let viewModel = AuthViewModel(registerAction: navigateToRegister)
        let controller = AuthViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    private func navigateToRegister() {
        let viewModel = RegisterViewModel(backAction: back, signUpAction: navigateToTabBar)
        let controller = RegisterViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    private func navigateToTabBar() {
        let coordinator = TabBarCoordinator(navigation: navigation)
        coordinator.start()
    }
}
