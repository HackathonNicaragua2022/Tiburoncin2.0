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
    
    // MARK: - Stored Properties
    let viewModel: HomeViewModel
    
    // MARK: Initializers
    init(viewModel: HomeViewModel) {
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
        homeView.setupView(viewModel: viewModel)
    }

    // MARK: - Setup
    private func setupView() {
    }
}
