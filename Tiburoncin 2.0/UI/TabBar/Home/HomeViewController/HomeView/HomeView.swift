//
//  HomeView.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

final class HomeView: UIView, NibOwnerLoadable {
    
    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        tableView.dataSource = self
        registerCells()
    }
    
    // MARK: - Register
    private func registerCells() {
        tableView.register(identifiers: [HomeTableViewCell.identifier])
    }
}

extension HomeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        return cell
    }
}
