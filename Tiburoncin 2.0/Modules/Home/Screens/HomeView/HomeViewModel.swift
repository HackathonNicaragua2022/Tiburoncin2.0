//
//  HomeViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class HomeViewModel: GenericTableViewModel {
    
    // MARK: - Stored Properties
    var cellViewModels: [GenericCellViewModel] = []
    
    // MARK: - Actions
    let classAction: ClassClosure
    
    // MARK: - Initializers
    init(classAction: @escaping ClassClosure) {
        self.classAction = classAction
        configureCellViewModels()
    }
}

// MARK: - GenericTableViewModel Setup
extension HomeViewModel {
    private
    func configureCellViewModels() {
        cellViewModels.append(HomeHeaderCellViewModel())
        cellViewModels.append(HomeCarouselCellViewModel(classAction: classAction))
        cellViewModels.append(HomeSolutionCellViewModel(classAction: classAction))
        cellViewModels.append(SpacerCellViewModel(height: 20))
    }
}
