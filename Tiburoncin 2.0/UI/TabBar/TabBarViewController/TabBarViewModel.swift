//
//  TabBarViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class TabBarViewModel {
    
    // MARK: - Actions
    let homeTabAction: ViewClosure
    let searchTabAction: ViewClosure
    let messageTabAction: ViewClosure
    let profileTabAction: ViewClosure
    
    // MARK: - Initializers
    init(homeTabAction: @escaping ViewClosure,
         searchTabAction: @escaping ViewClosure,
         messageTabAction: @escaping ViewClosure,
         profileTabAction: @escaping ViewClosure) {
        self.homeTabAction = homeTabAction
        self.searchTabAction = searchTabAction
        self.messageTabAction = messageTabAction
        self.profileTabAction = profileTabAction
    }
}
