//
//  Paging.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct Paging: Codable {
    let total, primaryResults, offset, limit: Int

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}
