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
        let coordinator = HomeCoordinator(containerView: view, videoAction: showVideo(classModel:))
        coordinator.start()
        currentTab = .home
    }
    
    private func navigateToSearch(in view: UIView) {
        guard currentTab != .search else { return }
        clearSubviews(for: view)
        let controller = SearchViewController()
        present(viewController: controller, in: view)
        currentTab = .search
    }
    
    private func navigateToMessage(in view: UIView) {
        guard currentTab != .message else { return }
        clearSubviews(for: view)
        let coordinator = MessageCoordinator(containerView: view)
        coordinator.start()
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
    
    private func showVideo(classModel: ClassModel) {
        let viewModel = VideoViewModel(classModel: classModel, backAction: back)
        let controller = VideoViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    private func present(viewController: UIViewController, in view: UIView) {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.view.translatesAutoresizingMaskIntoConstraints = false
        navigation.setNavigationBarHidden(true, animated: false)
        view.addSubview(navigation.view)
        navigation.view.layoutAttachAll(to: view)
    }
}
