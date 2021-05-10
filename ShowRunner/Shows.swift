//
//  Shows.swift
//  ShowRunner
//
//  Created by Mesut Aygün on 9.05.2021.
//

import Foundation
struct Show : Codable {
    var name : String
    var genres : [String]?
    var summary : String?
    var rating : Rating?
    var network : Network?
    var language : String?
    var image : Image?
}

struct Rating : Codable {
    var average : Double?
}
struct Network : Codable {
    var name : String?
}
struct Image : Codable {
    var original : String?
}
