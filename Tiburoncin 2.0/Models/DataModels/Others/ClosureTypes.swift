//
//  ClosureTypes.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/22/22.
//

import UIKit
import SwiftSDK

typealias SimpleClosure = () -> Void
typealias StringClosure = (String) -> Void
typealias BoolClosure = (Bool) -> Void
typealias ClassClosure = (Class) -> Void
typealias ClassCollectionClosure = ([Class]) -> Void
typealias CGFloatClosure = (CGFloat) -> Void
typealias InfluentialCollectionClosure = ([Influential]) -> Void
typealias IndexPathClosure = (IndexPath?) -> Void
typealias UIImageClosure = (UIImage?) -> Void
typealias UIImageCollectionClosure = ([UIImage?]) -> Void
typealias AnyClosure = (Any) -> Void
typealias TeacherClosure = (Teacher) -> Void
typealias UserClosure = (BackendlessUser) -> Void
typealias UserCollectionClosure = ([BackendlessUser]) -> Void
typealias FaultClosure = (Fault) -> Void
