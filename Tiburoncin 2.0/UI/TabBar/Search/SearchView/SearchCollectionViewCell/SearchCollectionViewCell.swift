//
//  SearchCollectionViewCell.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/23/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet var image: UIImageView!
    
    // MARK: View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Setup
    func setupCell(image: UIImage?) {
        containerView.setShadow()
        self.image.image = image
    }
}
