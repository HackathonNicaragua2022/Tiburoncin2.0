//
//  MessageTableViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageContainer: UIView!
    @IBOutlet var messageImage: UIImageView!
    
    // MARK: - Stored Properties
    var chatModel: ChatModel?
    
    // MARK: - Actions
    var didTapCell: ChatClosure = { _ in }
    
    // MARK: - Setup
    func setupCell(chatModel: ChatModel, didTapCell: @escaping ChatClosure) {
        self.chatModel = chatModel
        nameLabel.text = chatModel.name
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor.black.cgColor
        imageContainer.layer.cornerRadius = 50
        messageImage.layer.cornerRadius = 50
        
        let cellTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapViewContainer))
        viewContainer.addGestureRecognizer(cellTapGesture)
        self.didTapCell = didTapCell
    }
    
    // MARK: - Private Methods
    @objc private func didTapViewContainer() {
        guard let chatModel = chatModel else { return }
        didTapCell(chatModel)
    }
}
