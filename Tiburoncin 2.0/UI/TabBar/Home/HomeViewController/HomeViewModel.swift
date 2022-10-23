//
//  HomeViewModel.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import UIKit

final class HomeViewModel {
    
    // Stored Properties
    let videoAction: ClassModelClosure
    
    // Initializers
    init(videoAction: @escaping ClassModelClosure) {
        self.videoAction = videoAction
    }
}
