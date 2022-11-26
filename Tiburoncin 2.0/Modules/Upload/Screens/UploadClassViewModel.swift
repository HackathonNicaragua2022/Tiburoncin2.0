//
//  UploadClassViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/25/22.
//

import UIKit

final class UploadClassViewModel {
    
    // MARK: - Actions
    var showAlertAction: StringClosure = { _ in }
}

// MARK: - Service
extension UploadClassViewModel {
    func submitClass(with videoId: String, and className: String) {
        APIManager.shared.createNewClass(with: videoId, and: className, success: { classModel in
            print(classModel)
            self.showAlertAction("Se añadio la clase correctamente")
        }, fault: { fault in
            print(fault.message ?? "")
            self.showAlertAction("Hubo un error al intentar agregar el video, intenta luego mas tarde")
        })
    }
}
