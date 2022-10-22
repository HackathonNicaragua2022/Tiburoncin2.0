//
//  RegisterViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

class RegisterViewModel {
    
    // MARK: - Actions
    let backAction: SimpleClosure
    let signUpAction: SimpleClosure
    
    // MARK: - Initializers
    init(backAction: @escaping SimpleClosure, signUpAction: @escaping SimpleClosure) {
        self.backAction = backAction
        self.signUpAction = signUpAction
    }
}
