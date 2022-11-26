//
//  TabBarMenuItem.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class TabBarMenuItem: Equatable {
    
    // MARK: - Equatable
    static func == (lhs: TabBarMenuItem,
                    rhs: TabBarMenuItem) -> Bool {
        return lhs.container == rhs.container && lhs.tabBarMenuItemView == rhs.tabBarMenuItemView
    }
    
    // MARK: - Stored Properties
    var isStarted: Bool = false
    let tabBarMenuItemView: TabBarMenuItemView
    let coordinator: Coordinator
    
    // MARK: - Computed Properties
    var container: UIView {
        return coordinator.navigation.view
    }
    
    // MARK: - Initializers
    init(tabBarMenuItemView: TabBarMenuItemView,
         coordinator: Coordinator) {
        self.tabBarMenuItemView = tabBarMenuItemView
        self.coordinator = coordinator
    }
}

// MARK: - Public Methods
extension TabBarMenuItem {
    func startIfNeeded() {
        guard !isStarted else { return }
        self.coordinator.start()
        self.isStarted = true
    }
    
    func refresh() {
        tabBarMenuItemView.refresh()
    }
    
    func activate() {
        tabBarMenuItemView.active()
        container.isHidden = false
    }
    
    func deactive() {
        let lastViewController = coordinator.navigation.viewControllers.last
        lastViewController?.viewWillDisappear(false)
        tabBarMenuItemView.deactive()
        container.isHidden = true
        lastViewController?.viewDidDisappear(false)
    }
    
    func popToRoot(animated: Bool = true) {
        coordinator.backToRoot(animated: animated)
    }
}
