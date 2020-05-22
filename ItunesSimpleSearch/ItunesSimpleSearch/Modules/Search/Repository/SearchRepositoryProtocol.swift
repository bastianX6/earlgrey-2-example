//
//  SearchRepositoryProtocol.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

protocol SearchRepositoryProtocol: Component {
    func search(text: String,
                completion: @escaping (Result<[ItunesEntity], Error>) -> Void)
    func cancelPreviousSearch()
}
