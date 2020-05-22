//
//  NetworkClientProtocol.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

protocol NetworkClientProtocol {
    func getData(url: URL,
                 httpMethod: HttpMethod,
                 body: [String: Any]?,
                 completion: @escaping (Result<Data, Error>) -> Void)
    func cancelRequest()
}
