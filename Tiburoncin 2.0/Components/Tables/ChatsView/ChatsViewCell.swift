//
//  ChatsViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import UIKit
import SwiftSDK

class ChatsViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var lastMessageLabel: UILabel!
}

// MARK: - Setup
extension ChatsViewCell {
    func setup(user: BackendlessUser) {
        userNameLabel.text = user.name
        lastMessageLabel.text = "..."
        if let imageUrl = user.properties["userIcon"] as? String {
            userIcon.downloadAndSetImage(from: imageUrl)
        }
    }
}
