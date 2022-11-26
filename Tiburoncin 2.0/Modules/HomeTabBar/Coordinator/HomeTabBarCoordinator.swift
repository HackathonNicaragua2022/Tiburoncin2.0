//
//  HomeTabBarCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class HomeTabBarCoordinator: Coordinator {
    
    // MARK: - Actions
    let signOutAction: SimpleClosure
    
    // MARK: - Initializers
    init(navigation: UINavigationController?,
         signOutAction: @escaping SimpleClosure) {
        self.signOutAction = signOutAction
        super.init(navigation: navigation)
    }
    
    // MARK: - Coordinator
    override func start() {
        navigateToHomeTabBar()
    }
}

// MARK: - Navigation
extension HomeTabBarCoordinator {
    func navigateToHomeTabBar() {
        let viewModel = HomeTabBarViewModel(signOutAction: signOutAction)
        let controller = HomeTabBarViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
}
