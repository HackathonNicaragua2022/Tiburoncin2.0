//
//  SearchViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/25/22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var allResultsLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Stored Properties
    let viewModel: SearchViewModel
    var foundClasses = [Class]()
    
    // MARK: - Initializers
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension SearchViewController {
    private
    func setup() {
        registerCells()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Register
extension SearchViewController {
    private
    func registerCells() {
        collectionView.register(UINib(nibName: ClassImageViewCell.identifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: ClassImageViewCell.identifier)
    }
}

// MARK: - IBActions
extension SearchViewController {
    @IBAction func didChangeSearchText(_ sender: UITextField) {
        guard let text = sender.text else { return }
        viewModel.findClass(with: text, foundClasses: { [weak self] foundClasses in
            guard let self = self else { return }
            self.foundClasses = foundClasses
            self.allResultsLabel.isHidden = foundClasses.isEmpty
            self.collectionView.reloadData()
        })
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foundClasses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassImageViewCell.identifier, for: indexPath) as? ClassImageViewCell,
                let classModel = foundClasses[safe: indexPath.row] else { return UICollectionViewCell() }
        cell.setup(with: classModel,
                   classAction: viewModel.classAction)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 120
        let height: CGFloat = 120
        let size = CGSize(width: width, height: height)
        return size
    }
}
