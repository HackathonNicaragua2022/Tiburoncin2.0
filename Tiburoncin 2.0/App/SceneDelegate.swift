//
//  SceneDelegate.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Stored Properties
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navigation = setupNavigation()
        setupCoordinator(navigation: navigation, animated: true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Setup
    func setupNavigation() -> UINavigationController {
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true
        return navigation
    }
    
    func setupCoordinator(navigation: UINavigationController, animated: Bool) {
        let coordinator = AuthCoordinator(navigation: navigation)
        coordinator.start()
    }
}

