//
//  ProfileViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var signOutButtonView: UIView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userIcon: UIImageView!
    
    // MARK: - Stored Properties
    let viewModel: ProfileViewModel
    
    // MARK: - Initializers
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension ProfileViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if let imageUrl = viewModel.currentUser?.properties["userIcon"] as? String {
            userIcon.downloadAndSetImage(from: imageUrl)
        }
    }
}

// MARK: - Setup
extension ProfileViewController {
    private
    func setup() {
        usernameLabel.text = viewModel.currentUser?.name
        let signOutAction = UITapGestureRecognizer(target: self,
                                                   action: #selector(didTapSignOut))
        signOutButtonView.addGestureRecognizer(signOutAction)
    }
}

// MARK: - Private Methods
extension ProfileViewController {
    @objc
    private func didTapSignOut() {
        let alert = UIAlertController(title: "Estas a punto de cerrar sesión", message: "¿Desea proceder?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Si",
                                      style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.signOutAction()
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
