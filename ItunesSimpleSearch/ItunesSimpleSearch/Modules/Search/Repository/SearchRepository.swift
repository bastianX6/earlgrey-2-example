//
//  SearchRepository.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

class SearchRepository: SearchRepositoryProtocol {
    private let dataSource: ItunesDataSourceProtocol

    init(dataSource: ItunesDataSourceProtocol = ItunesDataSoruce()) {
        self.dataSource = dataSource
    }

    func search(text: String, completion: @escaping (Result<[ItunesEntity], Error>) -> Void) {
        self.dataSource.getSearchResults(for: text) { result in
            switch result {
            case let .success(response):
                completion(.success(response.results ?? []))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func cancelPreviousSearch() {
        self.dataSource.cancelRequest()
    }
}
