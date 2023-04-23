//
//  FilterValue.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct FilterValue: Codable {
    let id, name: String
    let pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
}
