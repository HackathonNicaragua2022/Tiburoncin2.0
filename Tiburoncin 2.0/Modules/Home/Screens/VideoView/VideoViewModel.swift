//
//  VideoViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

final class VideoViewModel {
    
    // MARK: - Stored Properties
    let classModel: Class
    
    // MARK: - Actions
    let backAction: SimpleClosure
    
    // MARK: - Initializers
    init(classModel: Class, backAction: @escaping SimpleClosure) {
        self.classModel = classModel
        self.backAction = backAction
    }
}
