//
//  RegisterViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit

final class RegisterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var backButtonView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var buttonLabel: UILabel!
    @IBOutlet var termsLabel: UILabel!
    
    // MARK: - Stored Properties
    let viewModel: RegisterViewModel
    var isRegisterAction = false
    
    // MARK: - Initializers
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension RegisterViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension RegisterViewController {
    private func setup() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(buttonTapAction))
        let tapBack = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapBack))
        buttonView.addGestureRecognizer(tapGesture)
        backButtonView.addGestureRecognizer(tapBack)
    }
}

// MARK: - Private Methods
extension RegisterViewController {
    @objc
    func didTapBack() {
        viewModel.backAction()
    }
    
    @objc
    private func buttonTapAction() {
        if isRegisterAction {
            guard isAbleToContinue(textFields: [usernameTextField]) else { return }
            
            let username = usernameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            viewModel.registerUser(name: username,
                                   email: email,
                                   password: password)
        } else {
            guard isAbleToContinue(textFields: [emailTextField, passwordTextField]) else { return }
            
            emailTextField.isHidden = !isRegisterAction
            passwordTextField.isHidden = !isRegisterAction
            usernameTextField.isHidden = isRegisterAction
            termsLabel.isHidden = isRegisterAction
            
            buttonLabel.text = "INSCRIBIRME"
            isRegisterAction.toggle()
        }
    }
    
    private func isAbleToContinue(textFields: [UITextField]) -> Bool {
        var isAbleToContinue = false
        var isValidText = [Bool]()
        
        textFields.forEach { textField in
            var isValid = false
            if textField == emailTextField {
                let emailPattern = #"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"#
                let emailRegex = try? NSRegularExpression(pattern: emailPattern,
                                                          options: [])
                let source = textField.text ?? ""
                let sourceRange = NSRange(source.startIndex..<source.endIndex,
                                          in: source)
                
                guard let result = emailRegex?.matches(in: source,
                                                       options: [],
                                                       range: sourceRange) else { return }
                isValid = !result.isEmpty
            } else {
                let text = textField.text ?? ""
                isValid = !text.isEmpty
            }
            
            isValidText.append(isValid)
        }
        isAbleToContinue = isValidText.filter { $0 }.count == isValidText.count
        return isAbleToContinue
    }
}
