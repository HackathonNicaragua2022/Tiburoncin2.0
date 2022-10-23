//
//  ChatTableViewCell.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet var messengerImage: UIImageView!
    @IBOutlet var messengerLabel: UILabel!
    @IBOutlet var receiverImage: UIImageView!
    @IBOutlet var receiverLabel: UILabel!
    
    // MARK: - Setup
    func setupCell(isReceivedMessage: Bool, message: String) {
        containerView.setShadow()
        containerView.layer.cornerRadius = 10
        
        receiverImage.isHidden = !isReceivedMessage
        receiverLabel.isHidden = !isReceivedMessage
        messengerImage.isHidden = isReceivedMessage
        messengerLabel.isHidden = isReceivedMessage
        
        if isReceivedMessage {
            receiverLabel.text = message
        } else {
            messengerLabel.text = message
        }
    }
}
