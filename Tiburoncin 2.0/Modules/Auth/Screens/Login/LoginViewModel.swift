//
//  LoginViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class LoginViewModel {
    
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
extension LoginViewModel {
    func login(email: String,
               password: String) {
        appAuthModule.signIn(email: email,
                             password: password)
    }
}
