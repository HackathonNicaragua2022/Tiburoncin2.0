//
//  TabBarCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

enum TabBarItem {
    case none, home, search, message, profile
}

final class TabBarCoordinator: Coordinator {
    
    // MARK: - Stored Properties
    var currentTab: TabBarItem = .none
    
    // MARK: - Coordinator
    override func start() {
        presentTabBar()
    }
    
    // MARK: - TabBarViewController
    private func presentTabBar() {
        let viewModel = TabBarViewModel(homeTabAction: navigateToHome,
                                        searchTabAction: navigateToSearch,
                                        messageTabAction: navigateToMessage,
                                        profileTabAction: navigateToProfile)
        let controller = TabBarViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    // MARK: - Navigation
    private func navigateToHome(in view: UIView) {
        guard currentTab != .home else { return }
        clearSubviews(for: view)
        let controller = HomeViewController()
        present(viewController: controller, in: view)
        currentTab = .home
    }
    
    private func navigateToSearch(in view: UIView) {
        guard currentTab != .search else { return }
        clearSubviews(for: view)
        currentTab = .search
    }
    
    private func navigateToMessage(in view: UIView) {
        guard currentTab != .message else { return }
        clearSubviews(for: view)
        let controller = MessageViewController()
        present(viewController: controller, in: view)
        currentTab = .message
    }
    
    private func navigateToProfile(in view: UIView) {
        guard currentTab != .profile else { return }
        clearSubviews(for: view)
        let controller = ProfileViewController()
        present(viewController: controller, in: view)
        currentTab = .profile
    }
    
    // MARK: - Private Methods
    private func clearSubviews(for view: UIView) {
        view.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func present(viewController: UIViewController, in view: UIView) {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.view.translatesAutoresizingMaskIntoConstraints = false
        navigation.setNavigationBarHidden(true, animated: false)
        view.addSubview(navigation.view)
        navigation.view.layoutAttachAll(to: view)
    }
}
