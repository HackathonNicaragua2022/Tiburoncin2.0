//
//  Builder.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import Foundation

typealias Dictionary = [String: Any]

func Builder<T: Decodable>(for data: Data) throws -> T {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
}

func Builder<T: Decodable>(dictionary: [Dictionary]) throws -> [T] {
    let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
    return try Builder(for: jsonData)
}
