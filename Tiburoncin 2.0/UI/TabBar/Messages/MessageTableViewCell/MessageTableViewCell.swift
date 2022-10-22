//
//  MessageTableViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageContainer: UIView!
    @IBOutlet var messageImage: UIImageView!
    
    // MARK: - Setup
    func setupCell(name: String) {
        nameLabel.text = name
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor.black.cgColor
        imageContainer.layer.cornerRadius = 50
        messageImage.layer.cornerRadius = 50
    }
}
