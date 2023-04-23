//
//  Shipping.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation

struct Shipping: Codable {
    let storePickUp, freeShipping: Bool
    let logisticType: String?
    let mode: String?
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case storePickUp = "store_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case mode, tags
    }
}
