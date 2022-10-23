//
//  HomeCoordinator.swift
//  Tiburoncin 2.0 Prototipo
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToHome()
    }
    
    // MARK: - Navigation
    private func navigateToHome() {
        let controller = HomeViewController()
        navigation.pushViewController(controller, animated: false)
    }
}
