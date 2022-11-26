//
//  SpacerCellViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/25/22.
//

import UIKit

class SpacerCellViewModel: GenericCellViewModel {
    
    // MARK: - GenericCellViewModel
    let cellType: UITableViewCell.Type = UITableViewCell.self
    var indexPath: IndexPath?
    var resizeAction: IndexPathClosure = { _ in }
    
    // MARK: - Stored Properties
    var height: CGFloat = 20.0
    
    // MARK: - Initializers
    init(height: CGFloat) {
        self.height = height
    }
}

// MARK: - Setup
extension SpacerCellViewModel {
    func setup(_ cell: UITableViewCell) {
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.contentView.backgroundColor = .clear
        cell.heightAnchor.constraint(equalToConstant: self.height).isActive = true
    }
}
