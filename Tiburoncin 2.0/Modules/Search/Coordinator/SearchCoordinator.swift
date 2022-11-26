//
//  SearchCoordinator.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    // MARK: - Actions
    let classAction: ClassClosure
    
    // MARK: - Initializers
    init(containerView: UIView,
         classAction: @escaping ClassClosure) {
        self.classAction = classAction
        super.init(containerView: containerView)
    }
    
    // MARK: - Coordinator
    override func start() {
        navigateToSearchView()
    }
}

// MARK: - Navigation
extension SearchCoordinator {
    private
    func navigateToSearchView() {
        let viewModel = SearchViewModel(classAction: classAction)
        let controller = SearchViewController(viewModel: viewModel)
        navigation.setViewControllers([controller], animated: true)
    }
}
