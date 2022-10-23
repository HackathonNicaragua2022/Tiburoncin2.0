//
//  VideoViewController.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

class VideoViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var backView: UIView!
    @IBOutlet var classIconImage: UIImageView!
    @IBOutlet var className: UILabel!
    @IBOutlet var classImage: UIImageView!
    
    // MARK: - Stored Properties
    let viewModel: VideoViewModel
    
    // MARK: - Initializers
    init(viewModel: VideoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        className.text = viewModel.classModel.className
        classImage.image = viewModel.classModel.classImage
        classIconImage.image = viewModel.classModel.classIcon
        
        classIconImage.layer.cornerRadius = 20
        let backTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBack))
        backView.addGestureRecognizer(backTapGesture)
    }
    
    // MARK: - Private Methods
    @objc private func didTapBack() {
        viewModel.backAction()
    }
}
