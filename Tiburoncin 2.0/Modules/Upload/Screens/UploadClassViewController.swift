//
//  UploadVideoViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/25/22.
//

import UIKit

class UploadClassViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var videoIdTextField: UITextField!
    @IBOutlet var classNameTextField: UITextField!
    @IBOutlet var submitVideoView: UIView!
    
    // MARK: - Stored Properties
    let viewModel: UploadClassViewModel
    
    // MARK: - Initializers
    init(viewModel: UploadClassViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.showAlertAction = showAlert(with:)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Life Cycle
extension UploadClassViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension UploadClassViewController {
    private
    func setup() {
        let submitTap = UITapGestureRecognizer(target: self,
                                               action: #selector(submitClass))
        submitVideoView.addGestureRecognizer(submitTap)
    }
}

// MARK: - Private Methods
extension UploadClassViewController {
    @objc
    private func submitClass() {
        guard let videoId = videoIdTextField.text,
              let className = classNameTextField.text,
              !videoId.isEmpty && !className.isEmpty else { return }
        viewModel.submitClass(with: videoId, and: className)
    }
    
    private
    func showAlert(with message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
