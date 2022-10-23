//
//  Coordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class Coordinator {
    
    // MARK: - Stored Properties
    
    var containerView: UIView?
    lazy var navigation: UINavigationController = {
        let nav = UINavigationController()
        nav.view.translatesAutoresizingMaskIntoConstraints = false
        containerView?.addSubview(nav.view)
        if let containerView = containerView {
            nav.view.layoutAttachAll(to: containerView)
        }
        nav.setNavigationBarHidden(true, animated: false)
        return nav
    }()
    
    // MARK: - Initializers
    init(navigation: UINavigationController?) {
        if let navigation = navigation {
            self.navigation = navigation
        }
    }
    
    init(containerView: UIView) {
        self.containerView = containerView
    }
    
    func start() { }
}

// MARK: - Public Methods
extension Coordinator {
    
    func back() {
        navigation.popViewController(animated: true)
    }
    
    func dismiss() {
        self.navigation.topViewController?.dismiss(animated: true)
    }
    
    func dismiss(with completion: (() -> Void)? = nil) {
        self.navigation.topViewController?.dismiss(animated: true,
                                                   completion: completion)
    }
    
    func backToRoot(animated: Bool = true) {
        navigation.popToRootViewController(animated: true)
    }
}
