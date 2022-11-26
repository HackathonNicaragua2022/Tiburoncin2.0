//
//  GenericTableView.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class GenericTableView: UITableView {
    
    // MARK: - Stored properties
    var viewModel: GenericTableViewModel?
    
    // MARK: - Computed Properties
    var cellViewModels: [GenericCellViewModel] {
        return viewModel?.cellViewModels ?? []
    }
    
    // MARK: - Initializers
    init() {
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: 0,
                                 height: 0), style: .plain)
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.bounces = false
        self.showsVerticalScrollIndicator = false
        self.dataSource = self
        self.allowsSelection = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerBasicCells()
    }
    
    func registerCells() {
        let registerableCellIds = self.cellViewModels.compactMap { $0.cellType.identifier }
        self.register(identifiers: registerableCellIds)
    }
    
    func registerBasicCells() {
        self.register(identifiers: [UITableViewCell.identifier])
    }
}

// MARK: - Setup
extension GenericTableView {
    func setupTableView(with viewModel: GenericTableViewModel) {
        self.viewModel = viewModel
        registerCells()
        reloadData()
    }
}

// MARK: - UITableViewDataSource
extension GenericTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = cellViewModels[safe: indexPath.row] else { return UITableViewCell() }
        return dequeueAndConfigureCell(at: indexPath,
                                       using: cellViewModel)
    }
}
