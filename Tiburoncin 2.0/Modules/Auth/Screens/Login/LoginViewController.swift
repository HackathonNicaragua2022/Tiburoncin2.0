//
//  LoginViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var backButtonView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButtonView: UIView!
    
    // MARK: - Stored Properties
    let viewModel: LoginViewModel
    
    // MARK: - Initializers
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension LoginViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension LoginViewController {
    private
    func setup() {
        let backTapGesture = UITapGestureRecognizer(target: self,
                                                    action: #selector(didTapBack))
        let loginTapGesture = UITapGestureRecognizer(target: self,
                                                     action: #selector(didTapLogin))
        backButtonView.addGestureRecognizer(backTapGesture)
        loginButtonView.addGestureRecognizer(loginTapGesture)
        
        emailTextField.accessibilityIdentifier = "loginViewEmail"
        passwordTextField.accessibilityIdentifier = "loginViewPassword"
        loginButtonView.accessibilityIdentifier = "loginViewButton"
    }
}

// MARK: - Private Methods
extension LoginViewController {
    @objc
    private func didTapBack() {
        backButtonView.preventRepeatedPresses()
        viewModel.backAction()
    }
    
    @objc
    private func didTapLogin() {
        loginButtonView.preventRepeatedPresses(inNext: 2)
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        viewModel.login(email: emailText,
                        password: passwordText)
    }
}
