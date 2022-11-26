//
//  AuthViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class AuthViewModel {
    
    // MARK: - Actions
    let showLoginAction: SimpleClosure
    let showRegisterAction: SimpleClosure
    
    // MARK: - Initializers
    init(loginAction: @escaping SimpleClosure,
         registerAction: @escaping SimpleClosure) {
        showLoginAction = loginAction
        showRegisterAction = registerAction
    }
}
