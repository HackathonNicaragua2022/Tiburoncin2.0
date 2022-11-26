//
//  ProfileCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    
    // MARK: - Actions
    let signOutAction: SimpleClosure
    
    // MARK: - Initializers
    init(containerView: UIView,
         signOutAction: @escaping SimpleClosure) {
        self.signOutAction = signOutAction
        super.init(containerView: containerView)
    }
    
    // MARK: - Coordinator
    override func start() {
        navigateToProfileView()
    }
}

// MARK: - Navigation
extension ProfileCoordinator {
    private
    func navigateToProfileView() {
        let viewModel = ProfileViewModel(signOutAction: signOutAction)
        let controller = ProfileViewController(viewModel: viewModel)
        controller.loadViewIfNeeded()
        navigation.setViewControllers([controller], animated: true)
    }
}
