//
//  HomeCollectionView.swift
//  Tiburoncin 2.0 Prototipo
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
       return true
    }
}

class HomeCollectionView: UIView, NibOwnerLoadable {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    // MARK: - Stored Properties
    let images = [UIImage(named: "finanzas1"), UIImage(named: "finanzas2"), UIImage(named: "finanzas3")]
    let channelIcon = [UIImage(named: "finanzas1Channel"), UIImage(named: "finanzas2Channel"), UIImage(named: "finanzas3Channel")]
    let channelName = ["Contador Contado", "Destino Profesional", "TUTO CONTABLE"]
    
    // MARK: - Actions
    var classModelAction: ClassModelClosure = { _ in }
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
    }
    
    // MARK: - Setup
    func setupView(classModelAction: @escaping ClassModelClosure) {
        self.classModelAction = classModelAction
        configureCollectionView()
    }
    
    // MARK: - ConfigureCollectionView
    private func configureCollectionView() {
        self.collectionView.delegate = self
        registerCells()
        let layout = CustomFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
    }
    
    // MARK: - Register
    private func registerCells() {
        collectionView.register(UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        let classModel = ClassModel(className: channelName[indexPath.row], classImage: images[indexPath.row], classIcon: channelIcon[indexPath.row])
        cell.setupCell(classModel: classModel, didTapCell: classModelAction)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
