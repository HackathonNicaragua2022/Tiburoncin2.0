//
//  AuthCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    // MARK: - Stored Properties
    lazy var appAuthModule = AppAuthModule(homeAction: navigateToHomeView)
    
    // MARK: - Coordinator
    override func start() {
        switch appAuthModule.currentAuthStatus {
        case .guest:
            navigateToAuthView()
        case .signedIn:
            APIManager.shared.isValidUserToken(isValid: { [weak self] isValid in
                guard let self = self else { return }
                if isValid {
                    self.navigateToHomeView()
                } else {
                    self.navigateToAuthView()
                }
            }, fault: { [weak self] fault in
                guard let self = self else { return }
                let faultMessage = fault.message ?? ""
                print("Error trying to see if user token is valid. " + faultMessage)
                self.navigateToAuthView()
            })
        }
    }
}

// MARK: - Navigation
extension AuthCoordinator {
    func navigateToAuthView() {
        let viewModel = AuthViewModel(loginAction: navigateToLoginView,
                                      registerAction: navigateToRegisterView)
        let controller = AuthViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    func navigateToHomeView() {
        let coordinator = HomeTabBarCoordinator(navigation: navigation) { [weak self] in
            guard let self = self else { return }
            self.appAuthModule.signOut()
            self.navigateToAuthView()
        }
        coordinator.start()
    }
    
    func navigateToLoginView() {
        let viewModel = LoginViewModel(appAuthModule: appAuthModule,
                                       backAction: back)
        let controller = LoginViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
    
    func navigateToRegisterView() {
        let viewModel = RegisterViewModel(appAuthModule: appAuthModule,
                                          backAction: back)
        let controller = RegisterViewController(viewModel: viewModel)
        navigation.pushViewController(controller, animated: true)
    }
}
