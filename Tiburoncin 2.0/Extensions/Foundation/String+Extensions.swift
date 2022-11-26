//
//  String+Extensions.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import Foundation

extension String {
    func decode() -> String? {
        if let data = Data.decode(encodedString: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil;
    }
}
