//
//  ChatsViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import UIKit
import SwiftSDK

class ChatsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Stored Properties
    let viewModel: ChatsViewModel
    var chats = [BackendlessUser]()
    
    // MARK: Initializers
    init(viewModel: ChatsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension ChatsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension ChatsViewController {
    private
    func setup() {
        registerCells()
        viewModel.getAllChats(success: { [weak self] response in
            guard let self = self else { return }
            self.chats = response
            self.tableView.dataSource = self
            self.tableView.rowHeight = 100
            self.tableView.reloadData()
        })
    }
}

// MARK: - Register
extension ChatsViewController {
    private
    func registerCells() {
        tableView.register(identifiers: [ChatsViewCell.identifier])
    }
}

// MARK: - UITableViewDataSource
extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let user = chats[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueCell(as: ChatsViewCell.self,
                                         at: indexPath)
        cell.setup(user: user)
        return cell
    }
}
