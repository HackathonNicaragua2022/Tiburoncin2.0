//
//  CombineImageDownloadManager.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import Combine
import UIKit

final class CombineImageDownloadManager {
    
    // MARK: - Stored Properties
    static let shared = CombineImageDownloadManager()
    private var cancellables = [AnyCancellable]()
    private var cache: NSCache = NSCache<NSString, UIImage>()
    
    subscript(key: String) -> UIImage? {
        get { cache.object(forKey: key as NSString) }
        set(image) { image == nil ? self.cache.removeObject(forKey: (key as NSString)) : self.cache.setObject(image!, forKey: (key as NSString)) }
    }
}

// MARK: - Public Methods
extension CombineImageDownloadManager {
    func downloadImage(url: String,
                       downloadedImage: @escaping UIImageClosure) {
        guard let url = URL(string: url) else { return }
        if let image = self[url.absoluteString] {
            downloadedImage(image)
            return
        }
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: UIImage(named: "Placeholder"))
            .handleEvents(receiveOutput: { self[url.absoluteString] = $0 })
            .receive(on: DispatchQueue.main)
            .sink { image in
                downloadedImage(image)
            }.store(in: &cancellables)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}
