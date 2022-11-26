//
//  ChatsViewModel.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import UIKit

final class ChatsViewModel {
}

// MARK: - Service
extension ChatsViewModel {
    func getAllChats(success: @escaping UserCollectionClosure) {
        APIManager.shared.getChats(success: success,
                                   fault: { fault in
            print(fault.message ?? "")
        })
    }
}
