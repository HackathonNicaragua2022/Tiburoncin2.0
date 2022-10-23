//
//  HomeCollectionViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var channelIconImage: UIImageView!
    @IBOutlet var channelName: UILabel!
    
    // MARK: - Setup
    func setupCell(videoImage: UIImage?, channelIconImage: UIImage?, channelName: String) {
        self.channelIconImage.layer.cornerRadius = 30
        self.channelIconImage.layer.borderColor = UIColor.black.cgColor
        self.channelIconImage.layer.borderWidth = 1
        
        self.videoImage.image = videoImage
        self.channelIconImage.image = channelIconImage
        self.channelName.text = channelName
    }
}
