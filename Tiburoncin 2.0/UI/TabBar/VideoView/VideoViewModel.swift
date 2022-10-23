//
//  VideoViewModel.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

final class VideoViewModel {
    
    // MARK: - Stored Properties
    let classModel: ClassModel
    
    // MARK: - Actions
    let backAction: SimpleClosure
    
    // MARK: - Initializers
    init(classModel: ClassModel, backAction: @escaping SimpleClosure) {
        self.classModel = classModel
        self.backAction = backAction
    }
}
