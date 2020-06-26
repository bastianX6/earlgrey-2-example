//
//  MockLookupRepository.swift
//  HelperBundle
//
//  Created by Bastián Véliz Vega on 24-06-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation
@testable import ItunesSimpleSearch

class MockLookupRepository: LookupRepositoryProtocol {
    private var jsonFile: String?
    private var error: NSError

    convenience init(jsonFile: String) {
        self.init()
        self.jsonFile = jsonFile
    }

    init(error: NSError = NSError(domain: "mock", code: -1, userInfo: nil)) {
        self.error = error
    }

    func getDetail(id: Int64,
                   completion: @escaping (Result<LookupDetailModel, Error>) -> Void) {
        if let jsonFile = self.jsonFile,
            let response: ItunesSearchResponse = JSONHelper.loadJSON(withFile: jsonFile),
            let entity = response.results?.first,
            let detail = LookupDetailModel(entity: entity) {
            completion(.success(detail))

        } else {
            completion(.failure(self.error))
        }
    }

    func cancelPreviousSearch() {}
}
