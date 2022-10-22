//
//  AuthViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class AuthViewModel {
    
    // MARK: - Actions
    var registerAction: SimpleClosure
    
    // MARK: - Initializers
    init(registerAction: @escaping SimpleClosure) {
        self.registerAction = registerAction
    }
}
