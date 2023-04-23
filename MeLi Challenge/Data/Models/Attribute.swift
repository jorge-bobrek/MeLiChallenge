//
//  Attribute.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct Attribute: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
    }
}
