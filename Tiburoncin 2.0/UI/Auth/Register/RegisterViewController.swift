//
//  RegisterViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var backView: UIView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var nextView: UIView!
    @IBOutlet var nextLabel: UILabel!
    @IBOutlet var termsLabel: UILabel!
    
    // MARK: - Stored Properties
    let viewModel: RegisterViewModel
    var isUpdatingView = false
    
    // MARK: - Initializers
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    func setupView() {
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBack))
        let nextTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapNext))
        backView.addGestureRecognizer(backTapGesture)
        nextView.addGestureRecognizer(nextTapGesture)
        
        let borderColor = UIColor(named: "Font Color")?.cgColor
        [emailTextField, passwordTextField, nickNameTextField].forEach { textField in
            textField?.layer.borderWidth = 2
            textField?.layer.borderColor = borderColor
        }
    }
    
    // MARK: - Private Methods
    @objc private func didTapBack() {
        viewModel.backAction()
    }
    
    @objc private func didTapNext() {
        if !isUpdatingView {
            emailTextField.isHidden = !isUpdatingView
            passwordTextField.isHidden = !isUpdatingView
            nickNameTextField.isHidden = isUpdatingView
            termsLabel.isHidden = isUpdatingView
            
            nextLabel.text = "INSCRIBIRME"
            isUpdatingView.toggle()
        } else {
            viewModel.signUpAction()
        }
    }
}
