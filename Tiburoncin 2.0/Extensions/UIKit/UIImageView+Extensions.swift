//
//  UIImageView+Extensions.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

extension UIImageView {
    func downloadAndSetImage(from url: String,
                             completion: SimpleClosure? = nil) {
        CombineImageDownloadManager.shared.downloadImage(url: url,
                                                         downloadedImage: { downloadedImage in
            guard let image = downloadedImage else {return }
            self.image = image
            completion?()
        })
    }
}
