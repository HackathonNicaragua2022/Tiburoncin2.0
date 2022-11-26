//
//  ClassImageViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

class ClassImageViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet var classImage: UIImageView!
    
    // MARK: - Stored properties
    var classModel: Class?
    
    // MARK: - Actions
    var classAction: ClassClosure = { _ in }
}

// MARK: - Setup
extension ClassImageViewCell {
    func setup(with classModel: Class,
               classAction: @escaping ClassClosure) {
        self.classModel = classModel
        classImage.downloadAndSetImage(from: classModel.classImage ?? "")
        
        let didTapCell = UITapGestureRecognizer(target: self,
                                                action: #selector(didTapCell))
        self.addGestureRecognizer(didTapCell)
        self.classAction = classAction
    }
}

// MARK: - Private Methods
extension ClassImageViewCell {
    @objc
    private func didTapCell() {
        guard let classModel = classModel else { return }
        classAction(classModel)
    }
}
