//
//  GenericTableViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

protocol GenericTableViewModel {
    var cellViewModels: [GenericCellViewModel] { get set }
}

protocol GenericCellViewModel: AnyObject {
    var cellType: UITableViewCell.Type { get }
    var indexPath: IndexPath? { get set }
    var resizeAction: IndexPathClosure { get set }
    
    func setup(_ cell: UITableViewCell)
}
