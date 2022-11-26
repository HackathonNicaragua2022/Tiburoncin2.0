//
//  UITableView+Extensions.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

extension UITableView {
    func register(identifiers: [String]) {
        for identifier in identifiers {
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    func dequeueAndConfigureCell<Cell: UITableViewCell>(at indexPath: IndexPath,
                                                        using viewModel: GenericCellViewModel) -> Cell {
        self.register(identifiers: [viewModel.cellType.identifier])
        guard let cell = self.dequeueCell(as: viewModel.cellType,
                                          at: indexPath) as? Cell else { return Cell() }
        viewModel.indexPath = indexPath
        viewModel.resizeAction = reloadRow(at:)
        viewModel.setup(cell)
        cell.selectionStyle = .none

        return cell
    }
    
    func dequeueCell<Cell: UITableViewCell>(as type: Cell.Type,
                                            at indexPath: IndexPath) -> Cell {
        guard type != UITableViewCell.self else { return Cell() }
        let id = type.identifier
        if let cell = self.dequeueReusableCell(withIdentifier: id,
                                               for: indexPath) as? Cell {
            return cell
        }
        else {
            return Cell()
        }
    }
    
    func reloadRow(at indexPath: IndexPath?) {
        guard let indexPath = indexPath else { return }
        self.reloadRows(at: [indexPath], with: .automatic)
    }
}
