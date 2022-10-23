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
    let viewModel: MessageViewModel
    
    // MARK: - Initializers
    init(viewModel: MessageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

// MARK: - UITableViewDataSource
extension MessageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier,
                                                       for: indexPath) as? MessageTableViewCell
        else { return UITableViewCell() }
        cell.setupCell(chatModel: messages[indexPath.row], didTapCell: viewModel.chatAction)
        return cell
    }
}
