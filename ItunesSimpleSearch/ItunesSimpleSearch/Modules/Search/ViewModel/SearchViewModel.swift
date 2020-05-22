//
//  SearchViewModel.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    var objectWillChange = PassthroughSubject<SearchViewModel, Never>()
    @Inject var repository: SearchRepositoryProtocol

    var text: String = "" {
        didSet {
            self.search()
        }
    }

    var state: SearchViewState<[SearchCellModel]> = .initial {
        didSet {
            self.objectWillChange.send(self)
        }
    }

    init(repository: SearchRepositoryProtocol) {
        self.repository = repository
    }

    init() {}

    func search() {
        self.updateState(.loading)
        self.repository.cancelPreviousSearch()
        self.repository.search(text: self.text) { [weak self] result in
            switch result {
            case let .success(entities):
                let data = entities.compactMap { SearchCellModel(entity: $0) }
                self?.updateState(.withData(data))
            case let .failure(error):
                self?.updateState(.error(error))
            }
        }
    }

    func updateState(_ state: SearchViewState<[SearchCellModel]>) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

enum SearchViewState<T> {
    case loading
    case withData(T)
    case error(Error)
    case initial
}
