//
//  TabBarMenuItemData.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

struct TabBarMenuItemData {
    var type: TabBarMenuItemType
    var coordinator: Coordinator
}

public enum TabBarMenuItemType: String {
    case home, search, upload, chat, profile
    
    var defaultIcon: UIImage? {
        UIImage(named: "ic-" + self.rawValue)
    }
}
