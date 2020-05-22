//
//  LookupRepositoryProtocol.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

protocol LookupRepositoryProtocol: Component {
    func getDetail(id: Int64,
                   completion: @escaping (Result<LookupDetailModel, Error>) -> Void)
    func cancelPreviousSearch()
}

enum LookupRepositoryError: Error {
    case noElements
}
