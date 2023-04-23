//
//  AvailableFilter.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct AvailableFilter: Codable {
    let id, name: String
    let type: String?
    let values: [AvailableFilterValue]
}
