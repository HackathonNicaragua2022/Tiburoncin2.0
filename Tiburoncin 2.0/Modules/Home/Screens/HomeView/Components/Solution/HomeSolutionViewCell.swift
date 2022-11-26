//
//  HomeSolutionViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

class HomeSolutionViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionHeight: NSLayoutConstraint!
    
    // MARK: - Stored Properties
    var classes = [Class]()
    
    // MARK: - Actions
    var classAction: ClassClosure = { _ in }
}

// MARK: - Setup
extension HomeSolutionViewCell {
    func setup(with classes: [Class],
               classAction: @escaping ClassClosure) {
        self.classes = classes
        self.classAction = classAction
        
        let spacer: CGFloat = 10 * CGFloat(classes.count / 2)
        var height: CGFloat = 130 * CGFloat(classes.count / 2)
        height += spacer
        
        collectionHeight.constant = height
        setupCollectionView()
    }
    
    func setupCollectionView() {
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
}

// MARK: - Register
extension HomeSolutionViewCell {
    private func registerCells() {
        collectionView.register(UINib(nibName: ClassImageViewCell.identifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: ClassImageViewCell.identifier)
    }
}

// MARK: - Private Methods
extension HomeSolutionViewCell {
}

// MARK: - UICollectionViewDataSource
extension HomeSolutionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassImageViewCell.identifier,
                                                            for: indexPath) as? ClassImageViewCell,
              let classModel = classes[safe: indexPath.row] else { return UICollectionViewCell() }
        cell.setup(with: classModel,
                   classAction: classAction)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeSolutionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 167
        let height: CGFloat = 130
        let size = CGSize(width: width, height: height)
        return size
    }
}
