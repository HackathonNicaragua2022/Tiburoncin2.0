//
//  HomeCollectionViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var channelIconImage: UIImageView!
    @IBOutlet var channelName: UILabel!
    
    // MARK: - Stored Properties
    var classModel: ClassModel?
    
    // MARK: - Actions
    var classModelAction: ClassModelClosure = { _ in }
    
    // MARK: - Setup
    func setupCell(classModel: ClassModel, didTapCell: @escaping ClassModelClosure) {
        self.classModel = classModel
        classModelAction = didTapCell
        self.channelIconImage.layer.cornerRadius = 30
        self.channelIconImage.layer.borderColor = UIColor.black.cgColor
        self.channelIconImage.layer.borderWidth = 1
        
        self.videoImage.image = classModel.classImage
        self.channelIconImage.image = classModel.classIcon
        self.channelName.text = classModel.className
        
        let cellTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapCell))
        containerView.addGestureRecognizer(cellTapGesture)
    }
    
    // MARK: - Private Methods
    @objc private func didTapCell() {
        guard let classModel = classModel else { return }
        classModelAction(classModel)
    }
}
