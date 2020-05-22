//
//  ItunesDataSoruce.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

class ItunesDataSoruce: ItunesDataSourceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func getSearchResults(for text: String,
                          completion: @escaping (Result<ItunesSearchResponse, Error>) -> Void) {
        let urlString = Endpoints.search.path

        guard let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString + "?term=" + query) else {
            completion(.failure(NetworkClientError.noUrl))
            return
        }

        self.client.getData(url: url, httpMethod: Endpoints.search.httpMethod, body: nil) {
            result in

            switch result {
            case let .success(data):
                do {
                    let response = try JSONDecoder().decode(ItunesSearchResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func getDetail(id: Int64,
                   completion: @escaping (Result<ItunesSearchResponse, Error>) -> Void) {
        let urlString = Endpoints.lookup.path
        let query = "\(id)"

        guard let url = URL(string: urlString + "?id=" + query) else {
            completion(.failure(NetworkClientError.noUrl))
            return
        }

        self.client.getData(url: url, httpMethod: Endpoints.lookup.httpMethod, body: nil) {
            result in

            switch result {
            case let .success(data):
                do {
                    let response = try JSONDecoder().decode(ItunesSearchResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func cancelRequest() {
        self.client.cancelRequest()
    }
}
