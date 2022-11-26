//
//  UploadCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class UploadCoordinator: Coordinator {
    
    // MARK: - Coordinator
    override func start() {
        navigateToUploadView()
    }
}

// MARK: - Navigation
extension UploadCoordinator {
    private func navigateToUploadView() {
        let viewModel = UploadClassViewModel()
        let controller = UploadClassViewController(viewModel: viewModel)
        navigation.setViewControllers([controller], animated: true)
    }
}
