//
//  HomeCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Actions
    let hideTabBar: SimpleClosure
    let showTabBar: SimpleClosure
    var customBack: SimpleClosure?
    
    // MARK: - Initializers
    init(containerView: UIView,
         hideTabBar: @escaping SimpleClosure,
         showTabBar: @escaping SimpleClosure) {
        self.hideTabBar = hideTabBar
        self.showTabBar = showTabBar
        super.init(containerView: containerView)
    }
    
    // MARK: - Coordinator
    override func start() {
        navigateToHomeView()
    }
}

// MARK: - Navigation
extension HomeCoordinator {
    private func navigateToHomeView() {
        let viewModel = HomeViewModel(classAction: navigateToVideoView(with:))
        let controller = HomeViewController(viewModel: viewModel)
        navigation.setViewControllers([controller], animated: true)
    }
    
    func navigateToVideoView(with classModel: Class) {
        hideTabBar()
        let viewModel = VideoViewModel(classModel: classModel) { [weak self] in
            guard let self = self else { return }
            self.showTabBar()
            if self.customBack != nil {
                self.customBack?()
            } else {
                self.back()
            }
        }
        let controller = VideoViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
}
