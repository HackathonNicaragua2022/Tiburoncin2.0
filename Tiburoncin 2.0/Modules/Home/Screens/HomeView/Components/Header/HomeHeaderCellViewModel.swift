//
//  HomeHeaderCellViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class HomeHeaderCellViewModel: GenericCellViewModel {
    
    // MARK: - GenericCellViewModel
    var cellType: UITableViewCell.Type = HomeHeaderViewCell.self
    var indexPath: IndexPath?
    var resizeAction: IndexPathClosure = { _ in }
}

// MARK: - Setup
extension HomeHeaderCellViewModel {
    func setup(_ cell: UITableViewCell) {
    }
}
