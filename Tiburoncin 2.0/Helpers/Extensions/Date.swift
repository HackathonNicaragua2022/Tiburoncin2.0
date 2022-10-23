//
//  Date.swift
//  Tiburoncin 2.0
//
//  Created by LuisMaltez on 10/22/22.
//

import Foundation

extension Date {
    func addDays(qty: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: qty, to: self) ?? self
    }
}
