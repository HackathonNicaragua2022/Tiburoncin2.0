//
//  HomeSolutionCellViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class HomeSolutionCellViewModel: GenericCellViewModel {
    
    // MARK: - GenericCellViewModel
    var cellType: UITableViewCell.Type = HomeSolutionViewCell.self
    var indexPath: IndexPath?
    var resizeAction: IndexPathClosure = { _ in }
    
    // MARK: - Stored Properties
    var classes = [Class]()
    
    // MARK: - Actions
    let classAction: ClassClosure
    
    // MARK: - Initializers
    init(classAction: @escaping ClassClosure) {
        self.classAction = classAction
        getAllClasses()
    }
}

// MARK: - Setup
extension HomeSolutionCellViewModel {
    func setup(_ cell: UITableViewCell) {
        guard let cell = cell as? HomeSolutionViewCell,
              !classes.isEmpty else { return }
        cell.setup(with: classes,
                   classAction: classAction)
    }
}

// MARK: - Services
extension HomeSolutionCellViewModel {
    private
    func getAllClasses() {
        APIManager.shared.getAllClasses(success: { [weak self] response in
            guard let self = self else { return }
            self.classes = response
            self.resizeAction(self.indexPath)
        }, fault: { fault in
            print(fault.message ?? "")
        })
    }
}
