//
//  MessageViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class MessageViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var headerView: UIView!
    @IBOutlet var tableView: UITableView!
    
    // MARK: Stored Properties
    let messages = ["Vladimir", "Sherly", "Maxihu", "Kenneth"]
    // View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        headerView.setShadow()
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        registerCells()
        tableView.reloadData()
    }
    
    // MARK: - Register
    private func registerCells() {
        let identifier = MessageTableViewCell.identifier
        tableView.register(UINib(nibName: identifier, bundle: nil),
                           forCellReuseIdentifier: identifier)
    }
}

extension MessageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier,
                                                       for: indexPath) as? MessageTableViewCell
        else { return UITableViewCell() }
        cell.setupCell(name: messages[indexPath.row])
        return cell
    }
}
