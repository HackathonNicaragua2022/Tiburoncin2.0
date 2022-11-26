//
//  HomeTabBarViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class HomeTabBarViewModel {
    
    // MARK: - Stored Properties
    var menus: [ TabBarMenuItem] = []
    var selected: TabBarMenuItem?
    
    // MARK: - Actions
    let signOutAction: SimpleClosure
    
    // MARK: - Initializers
    init(signOutAction: @escaping SimpleClosure) {
        self.signOutAction = signOutAction
    }
}

// MARK: - Public Methods
extension HomeTabBarViewModel {
    func tapMenu(menu: TabBarMenuItem?) {
        if menu != selected {
            selected?.deactive()
            selected = menu
            selected?.activate()
        }
    }
    
    func tapMenu(type: TabBarMenuItemType) -> TabBarMenuItem? {
        guard let menu = menus.first(where: { $0.tabBarMenuItemView.menuItemData?.type == type }) else { return nil }
        tapMenu(menu: menu)
        return menu
    }
    
    func addTabBarMenuItem(_ tabBarMenuItem: TabBarMenuItem) {
        menus.append(tabBarMenuItem)
    }
    
    func deactiveItems() {
        menus.forEach { $0.tabBarMenuItemView.deactive() }
    }
}
