//
//  Endpoints.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

public enum Endpoints {
    case search
    case lookup
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

extension Endpoints {
    var path: String {
        switch self {
        case .search:
            return BaseUrl.shared.baseUrlString + BaseEndpoints.search.rawValue
        case .lookup:
            return BaseUrl.shared.baseUrlString + BaseEndpoints.lookup.rawValue
        }
    }

    var httpMethod: HttpMethod {
        switch self {
        case .search:
            return .get
        case .lookup:
            return .get
        }
    }
}

enum BaseEndpoints: String {
    case search = "/search"
    case lookup = "/lookup"
}

class BaseUrl {
    private var defaultUrlString: String = "https://itunes.apple.com"
    lazy var baseUrlString: String = self.defaultUrlString

    public static let shared = BaseUrl()

    private init() {}
}
