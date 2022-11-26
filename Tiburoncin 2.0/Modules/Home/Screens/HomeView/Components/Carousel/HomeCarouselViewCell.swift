//
//  HomeCarouselViewCell.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
       return true
    }
}

class HomeCarouselViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Stored Properties
    var influentialClasses = [Influential]()
    
    // MARK: - Actions
    var didTapClass: ClassClosure = { _ in }
}

// MARK: - Setup
extension HomeCarouselViewCell {
    func setup(influentialClasses: [Influential],
               classAction: @escaping ClassClosure) {
        self.influentialClasses = influentialClasses
        didTapClass = classAction
        setupCollectionView()
    }
    
    func setupCollectionView() {
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = CustomFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        collectionView.reloadData()
    }
}

// MARK: - Register
extension HomeCarouselViewCell {
    private func registerCells() {
        collectionView.register(UINib(nibName: CarouselViewCell.identifier,
                       bundle: nil),
                 forCellWithReuseIdentifier: CarouselViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeCarouselViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return influentialClasses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselViewCell.identifier, for: indexPath) as? CarouselViewCell,
              let influentialClass = influentialClasses[safe: indexPath.row] else { return UICollectionViewCell() }
        cell.setup(with: influentialClass,
                   didTapClass: didTapClass)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeCarouselViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
