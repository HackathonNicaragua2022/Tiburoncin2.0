//
//  Teacher.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/24/22.
//

import UIKit

@objcMembers class Teacher: NSObject, Codable {
    var objectId: String?
    var name: String?
    var identifier: String?
    var profileIcon: String?
    var classes: [Class]?
}

@objcMembers class Class: NSObject, Codable {
    var objectId: String?
    var className: String?
    var classImage: String?
    var videoId: String?
    var teacher: Teacher?
}
