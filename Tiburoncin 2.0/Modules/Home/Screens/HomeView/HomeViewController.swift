//
//  HomeViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Stored Properties
    let viewModel: HomeViewModel
    let tableView = GenericTableView()
    
    // MARK: - Initializers
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension HomeViewController {
    private
    func setup() {
        view.addSubview(tableView)
        tableView.layoutAttachAll(to: view)
        tableView.setupTableView(with: viewModel)
    }
}
