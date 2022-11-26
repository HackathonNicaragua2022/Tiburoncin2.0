//
//  HomeCarouselCellViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class HomeCarouselCellViewModel: GenericCellViewModel {
    // MARK: - GenericCellViewModel
    var cellType: UITableViewCell.Type = HomeCarouselViewCell.self
    var indexPath: IndexPath?
    var resizeAction: IndexPathClosure = { _ in }
    
    // MARK: - Stored Properties
    var influentialClasses = [Influential]()
    
    // MARK: - Actions
    let classAction: ClassClosure
    
    // MARK: - Initializers
    init(classAction: @escaping ClassClosure) {
        self.classAction = classAction
        getInfluentialClasses()
    }
}

// MARK: - Setup
extension HomeCarouselCellViewModel {
    func setup(_ cell: UITableViewCell) {
        guard let cell = cell as? HomeCarouselViewCell,
              !influentialClasses.isEmpty else { return }
        cell.setup(influentialClasses: influentialClasses,
                   classAction: classAction)
    }
}

// MARK: - Services
extension HomeCarouselCellViewModel {
    private func getInfluentialClasses() {
        APIManager.shared.getInfluentialClasses(success: { [weak self] response in
            guard let self = self else { return }
            self.influentialClasses = response
            self.resizeAction(self.indexPath)
        }, fault: { fault in
            print(fault.message ?? "")
        })
    }
}
