//
//  ProfileViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var savedClasses: UIView!
    @IBOutlet var communityChat: UIView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        [communityChat, savedClasses].forEach { view in
            view?.layer.borderColor = UIColor(named: "Border Color")?.cgColor
            view?.layer.borderWidth = 2
            view?.layer.cornerRadius = 10
        }
    }
}
