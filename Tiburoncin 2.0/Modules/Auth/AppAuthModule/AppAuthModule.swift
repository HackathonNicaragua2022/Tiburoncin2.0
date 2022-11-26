//
//  AppAuthModule.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit
import SwiftSDK

enum AuthStatus: String {
    case guest
    case signedIn
}

final class AppAuthModule {
    
    // MARK: - Stored Properties
    let userDefaults = UserDefaults.standard
    let authKey = "authStatus"
    var currentAuthStatus: AuthStatus = .guest
    
    // MARK: - Actions
    let homeAction: SimpleClosure
    
    // MARK: - Initializers
    init(homeAction: @escaping SimpleClosure) {
        self.homeAction = homeAction
        setupAuthStatus()
    }
}

// MARK: - Setup
extension AppAuthModule {
    private func setupAuthStatus() {
        let status = userDefaults.object(forKey: authKey) as? String ?? ""
        if let authStatus = AuthStatus(rawValue: status) {
            currentAuthStatus = authStatus
        } else {
            userDefaults.set(currentAuthStatus.rawValue, forKey: authKey)
        }
    }
}

// MARK: - Public Methods
extension AppAuthModule {
    func signIn(email: String,
                password: String) {
        APIManager.shared.login(email: email, password: password, success: { [weak self] user in
            guard let self = self else { return }
            APIManager.shared.backendless.userService.currentUser = user
            self.updateAuthStatus(to: .signedIn)
            self.homeAction()
        }, fault: { fault in
            let faultMessage = fault.message ?? ""
            print("Error trying to login. " + faultMessage)
        })
    }
    
    func registerUser(name: String,
                      email: String,
                      password: String) {
        let user = BackendlessUser()
        user.name = name
        user.email = email
        user.password = password
        
        APIManager.shared.registerUser(user: user, success: { [weak self] _ in
            guard let self = self else { return }
            self.signIn(email: email, password: password)
        }, fault: { fault in
            let faultMessage = fault.message ?? ""
            print("Error trying to register new user. " + faultMessage)
        })
    }
    
    func signOut() {
        APIManager.shared.logoutUser(success: { [weak self] in
            guard let self = self else { return }
            self.updateAuthStatus(to: .guest)
            APIManager.shared.backendless.userService.currentUser = nil
        }, fault: { fault in
            let faultMessage = fault.message ?? ""
            print("Error trying to logout. " + faultMessage)
        })
    }
}

// MARK: - Private Methods
extension AppAuthModule {
    private
    func updateAuthStatus(to newStatus: AuthStatus) {
        currentAuthStatus = newStatus
        userDefaults.set(currentAuthStatus.rawValue, forKey: authKey)
    }
}
