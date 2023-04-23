//
//  ProductResponseMapper.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

struct ProductResponseMapper {
    public func map(_ data: [Result]) -> [Product] {
        data.map { item in
            Product(
                id: item.id,
                title: item.title,
                condition: item.condition,
                thumbnailID: item.thumbnailID,
                price: item.price,
                originalPrice: item.originalPrice,
                soldQuantity: item.soldQuantity,
                availableQuantity: item.availableQuantity,
                officialStoreName: item.officialStoreName,
                tags: item.tags,
                shipping: item.shipping,
                attributes: item.attributes
            )
        }
    }
}
