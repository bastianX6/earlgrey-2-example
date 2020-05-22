//
//  ItunesSearchResponse.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

struct ItunesSearchResponse: Codable {
    let resultCount: Int?
    let results: [ItunesEntity]?

    private enum ItunesSearchResponseKeys: String, CodingKey {
        case resultCount
        case results
    }
}
