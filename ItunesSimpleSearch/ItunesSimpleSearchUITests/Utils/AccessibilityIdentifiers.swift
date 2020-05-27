//
//  AccessibilityIdentifiers.swift
//  ItunesSimpleSearchUITests
//
//  Created by Bastián Véliz Vega on 24-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

enum LookupDetailViewIdentifiers: String {
    case loading
    case error
    case albumCover
    case song
    case album
    case artist

    var id: String {
        return "LookupDetailView." + self.rawValue
    }
}

enum SearchViewIdentifiers: String {
    case loading
    case error
    case empty
    case initial
    case cell
    case searchbar

    var id: String {
        return "SearchView." + self.rawValue
    }
}
