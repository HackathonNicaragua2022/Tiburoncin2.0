//
//  RegisterViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class RegisterViewModel {
    
    // MARK: - Stored Properties
    let appAuthModule: AppAuthModule
    
    // MARK: - Actions
    let backAction: SimpleClosure
    
    // MARK: - Initializers
    init(appAuthModule: AppAuthModule,
         backAction: @escaping SimpleClosure) {
        self.appAuthModule = appAuthModule
        self.backAction = backAction
    }
}

// MARK: - Public Methods
extension RegisterViewModel {
    func registerUser(name: String,
                      email: String,
                      password: String) {
        appAuthModule.registerUser(name: name,
                                   email: email,
                                   password: password)
    }
}
