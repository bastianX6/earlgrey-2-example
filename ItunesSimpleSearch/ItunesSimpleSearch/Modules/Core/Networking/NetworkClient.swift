//
//  NetworkClient.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

class NetworkClient: NetworkClientProtocol {
    private let urlSession: URLSession
    private var dataTask: URLSessionDataTask?

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func getData(url: URL,
                 httpMethod: HttpMethod,
                 body: [String: Any]?,
                 completion: @escaping (Result<Data, Error>) -> Void) {
        var httpBody: Data?

        if let body = body {
            do {
                httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                completion(.failure(error))
                return
            }
        }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = self.urlSession.dataTask(with: request) { responseData, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(NetworkClientError.badHttpStatus(statusCode: response.statusCode)))
                return
            }

            guard let responseData = responseData else {
                completion(.failure(NetworkClientError.noData))
                return
            }

            completion(.success(responseData))
        }

        task.resume()
        self.dataTask = task
    }

    func cancelRequest() {
        self.dataTask?.cancel()
    }
}
