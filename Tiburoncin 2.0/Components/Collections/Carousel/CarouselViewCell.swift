//
//  CarouselViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

class CarouselViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet var classImage: UIImageView!
    @IBOutlet var teacherImage: UIImageView!
    @IBOutlet var teacherNameLabel: UILabel!
    @IBOutlet var teacherIdentifierLabel: UILabel!
    
    // MARK: - Stored Properties
    var influentialClass: Influential?
    
    // MARK: - Actions
    var didTapClass: ClassClosure = { _ in }
}

// MARK: - Setup
extension CarouselViewCell {
    func setup(with influentialClass: Influential,
               didTapClass: @escaping ClassClosure) {
        self.influentialClass = influentialClass
        
        teacherNameLabel.text = influentialClass.classIcon?.teacher?.name
        teacherIdentifierLabel.text = influentialClass.classIcon?.teacher?.identifier
        classImage.downloadAndSetImage(from: influentialClass.classIcon?.classImage ?? "")
        teacherImage.downloadAndSetImage(from: influentialClass.classIcon?.teacher?.profileIcon ?? "")
        
        self.didTapClass = didTapClass
        
        let cellTapGesture = UITapGestureRecognizer(target: self,
                                                    action: #selector(didTapCell))
        self.addGestureRecognizer(cellTapGesture)
    }
}

// MARK: - Private Methods
extension CarouselViewCell {
    @objc
    private func didTapCell() {
        guard let classModel = influentialClass?.classIcon else { return }
        didTapClass(classModel)
    }
}
