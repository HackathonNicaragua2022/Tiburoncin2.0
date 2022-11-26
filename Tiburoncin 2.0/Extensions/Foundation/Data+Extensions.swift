//
//  Data+Extensions.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/26/22.
//

import Foundation

extension Data {
    static
    func decode(encodedString: String) -> Data? {
        var encoded = encodedString
        let remainder = encoded.count % 4
        if remainder > 0 {
            encoded = encoded.padding(toLength: encoded.count + 4 - remainder,
                                      withPad: "=", startingAt: 0)
        }
        
        return Data(base64Encoded: encoded)
    }
}
