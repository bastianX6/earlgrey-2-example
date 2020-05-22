//
//  LookupRepository.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

class LookupRepository: LookupRepositoryProtocol {
    private let dataSource: ItunesDataSourceProtocol

    init(dataSource: ItunesDataSourceProtocol = ItunesDataSoruce()) {
        self.dataSource = dataSource
    }

    func getDetail(id: Int64,
                   completion: @escaping (Result<LookupDetailModel, Error>) -> Void) {
        self.dataSource.getDetail(id: id) { result in
            switch result {
            case let .success(response):
                if let entity = response.results?.first,
                    let model = LookupDetailModel(entity: entity) {
                    completion(.success(model))
                } else {
                    completion(.failure(LookupRepositoryError.noElements))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func cancelPreviousSearch() {
        self.dataSource.cancelRequest()
    }
}
