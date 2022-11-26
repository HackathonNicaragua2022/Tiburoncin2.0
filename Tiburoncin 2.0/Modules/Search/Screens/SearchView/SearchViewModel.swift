//
//  SearchViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/25/22.
//

import UIKit

final class SearchViewModel {
    
    // MARK: - Actions
    let classAction: ClassClosure
    
    // MARK: - Initializers
    init(classAction: @escaping ClassClosure) {
        self.classAction = classAction
    }
}

// MARK: - Service
extension SearchViewModel {
    func findClass(with name: String,
                           foundClasses: @escaping ClassCollectionClosure) {
        APIManager.shared.findAllClasses(with: name, success: { classes in
            foundClasses(classes)
        }, fault: { fault in
            print(fault.message ?? "")
        })
    }
}
