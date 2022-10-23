//
//  SearchView.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/23/22.
//

import UIKit

class SearchView: UIView, NibOwnerLoadable {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    
    // MARK: - Stored Properties
    var images = [UIImage?]()
    
    // Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        headerView.setShadow()
        
        searchBar.layer.borderColor = UIColor(named: "Border Color")?.cgColor
        searchBar.layer.borderWidth = 2
        searchBar.delegate = self
        
        let image1 = UIImage(named: "finanzas1")
        let image2 = UIImage(named: "finanzas2")
        let image3 = UIImage(named: "finanzas3")
        let image4 = UIImage(named: "shark")
        
        for _ in 0...7 {
            images.append(image1)
            images.append(image2)
            images.append(image3)
            images.append(image4)
        }
        collectionView.dataSource = self
        registerCells()
        collectionView.reloadData()
    }
    
    // MARK: - Register
    private func registerCells() {
        collectionView.register(UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension SearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(image: images[indexPath.row])
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        collectionView.isHidden = searchText.isEmpty
    }
}
