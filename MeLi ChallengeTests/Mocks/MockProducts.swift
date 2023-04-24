//
//  MockProducts.swift
//  MeLi ChallengeTests
//
//  Created by Jorge Bobrek on 23/04/23.
//

import Foundation
@testable import MeLi_Challenge

struct MockProducts {
    static let products =
    [
        Product(
            id: "MCO837893754",
            title: "Nintendo Switch Oled 64gb Standard Color Blanco Y Negro",
            condition: .new,
            thumbnailID: "909032-MLA47920360780_102021",
            price: 1759900,
            originalPrice: 1959900,
            soldQuantity: 250,
            availableQuantity: 1,
            officialStoreName: nil,
            tags: [
                "good_quality_thumbnail",
                "loyalty_discount_eligible",
                "good_quality_picture",
                "immediate_payment",
                "cart_eligible",
                "best_seller_candidate",
                "meli_choice_candidate"
            ],
            shipping: Shipping(
                storePickUp: false,
                freeShipping: true,
                logisticType: "cross_docking",
                mode: "me2",
                tags: [
                    "self_service_in",
                    "mandatory_free_shipping"
                ]
            ),
            attributes: [
                Attribute(
                    id: "BRAND",
                    name: "Marca",
                    valueName: "Nintendo"
                ),
                Attribute(
                    id: "ITEM_CONDITION",
                    name: "Condición del ítem",
                    valueName: "Nuevo"
                )
            ]
        ),
        Product(
            id: "MCO837900033",
            title: "Nintendo Switch Oled 64gb Standard Color Rojo Neón, Azul Neón Y Negro",
            condition: .new,
            thumbnailID: "980407-MLA47920420600_102021",
            price: 1759900,
            originalPrice: 1959900,
            soldQuantity: 250,
            availableQuantity: 1,
            officialStoreName: nil,
            tags: [
                "loyalty_discount_eligible",
                "good_quality_picture",
                "good_quality_thumbnail",
                "immediate_payment",
                "cart_eligible",
                "best_seller_candidate",
                "meli_choice_candidate"
            ],
            shipping: Shipping(
                storePickUp: false,
                freeShipping: true,
                logisticType: "cross_docking",
                mode: "me2",
                tags: [
                    "self_service_in",
                    "mandatory_free_shipping"
                ]
            ),
            attributes: [
                Attribute(
                    id: "BRAND",
                    name: "Marca",
                    valueName: "Nintendo"
                )
            ]
        )
    ]
}
