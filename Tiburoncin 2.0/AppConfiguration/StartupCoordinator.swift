//
//  StartupCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class StartupCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToHome()
    }
}

// MARK: - Navigation
extension StartupCoordinator {
    private func navigateToHome() {
        let coordinator = AuthCoordinator(navigation: navigation)
        coordinator.start()
    }
}
