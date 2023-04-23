//
//  ProductResponse.swift
//  MeLi Challenge
//
//  Created by Jorge Bobrek on 22/04/23.
//

import Foundation

// MARK: - Product
struct ProductResponse: Codable {
    let siteID: String
    let countryDefaultTimeZone, query: String
    let paging: Paging
    let results: [Result]
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query, paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
}
