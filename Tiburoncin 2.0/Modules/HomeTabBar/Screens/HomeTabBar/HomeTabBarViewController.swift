//
//  HomeTabBarViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class HomeTabBarViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet var tabBarContainerView: UIView!
    @IBOutlet var tabBarStackView: UIStackView!
    @IBOutlet var bar: UIView!
    
    // MARK: - Stored Properties
    let viewModel: HomeTabBarViewModel
    
    // MARK: - Initializerss
    init(viewModel: HomeTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension HomeTabBarViewController {
    override func viewDidLoad() {
        setupTabBar()
    }
}

// MARK: - TabBar Setup
extension HomeTabBarViewController {
    private
    func setupTabBar() {
        containerView.accessibilityIdentifier = "homeTabBarContainer"
        
        let homeCoordinator = HomeCoordinator(containerView: containerView,
                                              hideTabBar: hideTabBar,
                                              showTabBar: showTabBar)
        let homeTab = TabBarMenuItemData(type: .home,
                                         coordinator: homeCoordinator)
        let firstItem = addTabBarMenuItem(menuItemData: homeTab)
        
        let searchCoordinator = SearchCoordinator(containerView: containerView,
                                                  classAction: { [weak self] classModel in
            guard let self = self else { return }
            self.tapMenu(type: .home)
            homeCoordinator.customBack = {
                self.tapMenu(type: .search)
                homeCoordinator.back()
                homeCoordinator.customBack = nil
            }
            homeCoordinator.navigateToVideoView(with: classModel)
        })
        let searchTab = TabBarMenuItemData(type: .search,
                                           coordinator: searchCoordinator)
        addTabBarMenuItem(menuItemData: searchTab)
        
        if let isTeacher = APIManager.shared.backendless.userService.currentUser?.properties["isTeacher"] as? Bool,
            isTeacher  {
            let uploadCoordinator = UploadCoordinator(containerView: containerView)
            let uploadTab = TabBarMenuItemData(type: .upload,
                                               coordinator: uploadCoordinator)
            addTabBarMenuItem(menuItemData: uploadTab)
        }
        
        let chatCoordinator = ChatCoordinator(containerView: containerView)
        let chatTab = TabBarMenuItemData(type: .chat,
                                         coordinator: chatCoordinator)
        addTabBarMenuItem(menuItemData: chatTab)
        
        let profileCoordinator = ProfileCoordinator(containerView: containerView,
                                                    signOutAction: { [weak self] in
            guard let self = self else { return }
            self.viewModel.deactiveItems()
            self.viewModel.signOutAction()
        })
        let profileTab = TabBarMenuItemData(type: .profile,
                                            coordinator: profileCoordinator)
        addTabBarMenuItem(menuItemData: profileTab)
        
        tabBarStackView.layoutIfNeeded()
        viewModel.deactiveItems()
        
        tapMenu(menuItem: firstItem)
        moveBar(to: firstItem.tabBarMenuItemView)
        self.view.bringSubviewToFront(containerView)
    }
    
    @discardableResult
    func addTabBarMenuItem(menuItemData: TabBarMenuItemData) -> TabBarMenuItem {
        let itemView = TabBarMenuItemView()
        itemView.setup(menuItemData: menuItemData)
        
        let menuItem = TabBarMenuItem(tabBarMenuItemView: itemView,
                                      coordinator: menuItemData.coordinator)
        
        menuItem.tabBarMenuItemView.set(action: { [weak self] in
            guard let self = self else { return }
            self.tapMenu(menuItem: menuItem)
        })
        tabBarStackView.addArrangedSubview(itemView)
        
        viewModel.addTabBarMenuItem(menuItem)
        
        if let menuView = tabBarStackView.superview {
            self.view.bringSubviewToFront(menuView)
        }
        
        return menuItem
    }
}

// MARK: - Private Methods
extension HomeTabBarViewController {
    private
    func tapMenu(menuItem: TabBarMenuItem) {
        menuItem.startIfNeeded()
        
        viewModel.tapMenu(menu: menuItem)
        moveBar(to: menuItem.tabBarMenuItemView)
        
        menuItem.coordinator.navigation
            .topViewController?.viewWillAppear(true)
        menuItem.coordinator.navigation
            .topViewController?.viewDidAppear(true)
    }
    
    private
    func tapMenu(type: TabBarMenuItemType) {
        guard let menuItem = viewModel.tapMenu(type: type) else { return }
        menuItem.startIfNeeded()
        moveBar(to: menuItem.tabBarMenuItemView)
        
        menuItem.coordinator.navigation
            .topViewController?.viewWillAppear(true)
        menuItem.coordinator.navigation
            .topViewController?.viewDidAppear(true)
        
    }
    
    private
    func moveBar(to item: TabBarMenuItemView) {
        let itemFrame = tabBarContainerView.convert(item.frame,
                                                    from: tabBarStackView)
        let pos = itemFrame.origin.x + (itemFrame.width / 2) - (bar.frame.width / 2)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseInOut) { [weak self] in
            self?.bar.transform = CGAffineTransform(translationX: pos, y: 0)
        } completion: { [weak self] _ in
            self?.bar.isHidden = false
        }
    }
    
    private
    func hideTabBar() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.tabBarContainerView.isHidden = true
        }
    }
    
    private
    func showTabBar() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.tabBarContainerView.isHidden = false
        }
    }
}
