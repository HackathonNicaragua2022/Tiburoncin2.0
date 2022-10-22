//
//  AuthViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var signInView: UIView!
    @IBOutlet var registerView: UIView!
    
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
    
    // MARK: - View LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // MARK: - Setup
    private func setupView() {
        signInView.layer.cornerRadius = 10
        signInView.layer.borderColor = UIColor(named: "Border Color")?.cgColor
        signInView.layer.borderWidth = 2
        registerView.layer.cornerRadius = 10
        
        let registerTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRegisterView))
        registerView.addGestureRecognizer(registerTapGesture)
    }
    
    // MARK: - Private Methods
    @objc private func didTapRegisterView() {
        viewModel.registerAction()
    }
}
