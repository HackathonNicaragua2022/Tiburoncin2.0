//
//  VideoViewController.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit
import YouTubeiOSPlayerHelper

class VideoViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var backView: UIView!
    @IBOutlet var playerView: YTPlayerView!
    @IBOutlet var teacherImage: UIImageView!
    @IBOutlet var teacherName: UILabel!
    @IBOutlet var teacherIdentifier: UILabel!
    
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
}

// MARK: - View Life Cycle
extension VideoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup
extension VideoViewController {
    private
    func setup() {
        teacherName.text = viewModel.classModel.teacher?.name
        teacherIdentifier.text = viewModel.classModel.teacher?.identifier
        teacherImage.downloadAndSetImage(from: viewModel.classModel.teacher?.profileIcon ?? "")
        
        playerView.load(withVideoId: viewModel.classModel.videoId ?? "",
                        playerVars: ["playsinline" : 1])
        playerView.delegate = self
        
        let backTapGesture = UITapGestureRecognizer(target: self,
                                                    action: #selector(didTapBack))
        backView.addGestureRecognizer(backTapGesture)
    }
}

// MARK: - Private Methods
extension VideoViewController {
    @objc
    private func didTapBack() {
        viewModel.backAction()
    }
}

extension VideoViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
