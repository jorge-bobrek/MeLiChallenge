//
//  Product.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

struct Product: Identifiable {
    let id: String
    let title: String
    let condition: Condition
    let thumbnailID: String
    let price: Int
    let originalPrice: Int?
    let soldQuantity: Int
    let availableQuantity: Int?
    let officialStoreName: String?
    let tags: [String]
    let shipping: Shipping
    let attributes: [Attribute]

    static let example = Product(
        id: "MCO905505432",
        title: "Caminadora Eléctrica Home Sale Serene 110v/220v Negra Y Gris",
        condition: .new,
        thumbnailID: "885161-MLA50170707614_062022",
        price: 1074900,
        originalPrice: 2399900,
        soldQuantity: 150,
        availableQuantity: 500,
        officialStoreName: "Homesale",
        tags: [
            "deal_of_the_day",
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
            logisticType: "drop_off",
            mode: "me2",
            tags: [
                "mandatory_free_shipping"
            ]
        ),
        attributes: [
                Attribute(
                    id: "BRAND",
                    name: "Marca",
                    valueName: "Home Sale"
                ),
                Attribute(
                    id: "ITEM_CONDITION",
                    name: "Condición del ítem",
                    valueName: "Nuevo"
                ),
                Attribute(
                    id: "MODEL",
                    name: "Modelo",
                    valueName: "Serene"
                ),
                Attribute(
                    id: "PACKAGE_LENGTH",
                    name: "Largo del paquete",
                    valueName: "120 cm"
                ),
                Attribute(
                    id: "PACKAGE_WEIGHT",
                    name: "Peso del paquete",
                    valueName: "25000 g"
                ),
                Attribute(
                    id: "POWER",
                    name: "Potencia",
                    valueName: "1.5 hp"
                )
            ]
    )
}
