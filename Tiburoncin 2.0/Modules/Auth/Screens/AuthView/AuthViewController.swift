//
//  AuthViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class AuthViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var loginView: UIView!
    @IBOutlet var signInView: UIView!
    
    // MARK: - Stored Properties
    let viewModel: AuthViewModel
    
    // MARK: - Initializers
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension AuthViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension AuthViewController {
    private func setup() {
        let loginTap = UITapGestureRecognizer(target: self,
                                              action: #selector(didTapLogin))
        let signInTap = UITapGestureRecognizer(target: self,
                                               action: #selector(didTapSignIn))
        
        loginView.addGestureRecognizer(loginTap)
        signInView.addGestureRecognizer(signInTap)
        loginView.accessibilityIdentifier = "loginButtonView"
    }
}

// MARK: - Private Methods
extension AuthViewController {
    @objc
    private func didTapLogin() {
        loginView.preventRepeatedPresses()
        viewModel.showLoginAction()
    }
    
    @objc
    private func didTapSignIn() {
        signInView.preventRepeatedPresses()
        viewModel.showRegisterAction()
    }
}
