//
//  UITableView.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

extension UITableView {
    func register(identifiers: [String]) {
        for identifier in identifiers {
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: identifier)
        }
    }
}
