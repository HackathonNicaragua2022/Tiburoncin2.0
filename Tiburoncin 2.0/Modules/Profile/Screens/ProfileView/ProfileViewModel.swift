//
//  ProfileViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit
import SwiftSDK

final class ProfileViewModel {
    
    // MARK: - Computed Properties
    var currentUser: BackendlessUser? {
        Backendless.shared.userService.currentUser
    }
    
    // MARK: - Actions
    let signOutAction: SimpleClosure
    
    // MARK: - Initializers
    init(signOutAction: @escaping SimpleClosure) {
        self.signOutAction = signOutAction
    }
}
