//
//  NetworkClientError.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

enum NetworkClientError: LocalizedError {
    case badHttpStatus(statusCode: Int)
    case noData
    case noUrl
}

extension NetworkClientError {
    var errorDescription: String? {
        switch self {
        case let .badHttpStatus(statusCode):
            return "The Http status code is: \(statusCode)"
        case .noData:
            return "The Http request does not have data"
        case .noUrl:
            return "Couldn't parse Url"
        }
    }
}
