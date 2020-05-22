//
//  ItunesDataSourceProtocol.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

protocol ItunesDataSourceProtocol {
    func getSearchResults(for text: String,
                          completion: @escaping (Result<ItunesSearchResponse, Error>) -> Void)
    func getDetail(id: Int64,
                   completion: @escaping (Result<ItunesSearchResponse, Error>) -> Void)
    func cancelRequest()
}

enum ItunesDataSourceError: Error {
    case parseError
}
