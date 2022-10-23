//
//  ChatViewController.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

class ChatViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet var headerView: UIView!
    @IBOutlet var messengerName: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Stored Properties
    let viewModel: ChatViewModel
    var messages = [(isReceivedMessage: Bool, message: String)]()
    
    // MARK: - Initializers
    init(viewModel: ChatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        headerView.setShadow()
        messengerName.text = viewModel.chatModel.name
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        let allMessages = viewModel.chatModel.messengerMessages + viewModel.chatModel.receiver
        var sortedMessages: [(date: Date, isReceivedMessage: Bool, message: String)] = []
        allMessages.forEach { date, message in
            sortedMessages.append((date, viewModel.chatModel.receiver.map { $0.sentDate }.contains(date), message))
        }
        sortedMessages.sort { $0.date < $1.date }
        messages = sortedMessages.map { ($0.isReceivedMessage, $0.message) }
        registerCells()
        tableView.reloadData()
        
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBack))
        backView.addGestureRecognizer(backTapGesture)
    }
    
    // MARK: - Register
    private func registerCells() {
        tableView.register(UINib(nibName: ChatTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    // MARK: - Private Methods
    @objc private func didTapBack() {
        viewModel.backAction()
    }
}

// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        let message = messages[indexPath.row]
        cell.setupCell(isReceivedMessage: message.isReceivedMessage, message: message.message)
        return cell
    }
}
