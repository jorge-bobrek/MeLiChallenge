//
//  Result.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct Result: Codable {
    let id: String
    let title: String
    let condition: Condition
    let thumbnailID: String
    let price: Int
    let originalPrice: Int?
    let soldQuantity: Int
    let availableQuantity: Int
    let officialStoreName: String?
    let tags: [String]
    let shipping: Shipping
    let attributes: [Attribute]

    enum CodingKeys: String, CodingKey {
        case id, title, price, condition
        case thumbnailID = "thumbnail_id"
        case originalPrice = "original_price"
        case soldQuantity = "sold_quantity"
        case availableQuantity = "available_quantity"
        case officialStoreName = "official_store_name"
        case tags, shipping, attributes
    }
}

enum Condition: String, Codable {
    case new
    case used
}
