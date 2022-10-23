//
//  HomeViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var homeView: HomeView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setup
    private func setupView() {
    }
}
