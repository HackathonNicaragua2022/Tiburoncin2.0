//
//  HomeCoordinator.swift
//  Tiburoncin 2.0 Prototipo
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Stored Properties
    let videoAction: ClassModelClosure
    
    // MARK: - Initializers
    init(containerView: UIView, videoAction: @escaping ClassModelClosure) {
        self.videoAction = videoAction
        super.init(containerView: containerView)
    }
    
    // MARK: - Coordinator
    override func start() {
        navigateToHome()
    }
    
    // MARK: - Navigation
    private func navigateToHome() {
        let viewModel = HomeViewModel(videoAction: videoAction)
        let controller = HomeViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: false)
    }
}
