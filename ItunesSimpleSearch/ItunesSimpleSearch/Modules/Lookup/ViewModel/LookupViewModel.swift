//
//  LookupViewModel.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Combine
import Foundation
class LookupViewModel: ObservableObject {
    var objectWillChange = PassthroughSubject<LookupViewModel, Never>()

    @Inject var repository: LookupRepositoryProtocol

    var state: LookupViewState<LookupDetailModel> = .loading {
        didSet {
            self.objectWillChange.send(self)
        }
    }

    init(repository: LookupRepositoryProtocol) {
        self.repository = repository
    }

    init() {}

    func loadDetail(trackId: Int64) {
        self.updateState(.loading)
        self.repository.getDetail(id: trackId) { [weak self] result in
            switch result {
            case let .success(model):
                self?.updateState(.withData(model))
            case let .failure(error):
                self?.updateState(.error(error))
            }
        }
    }

    func updateState(_ state: LookupViewState<LookupDetailModel>) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

enum LookupViewState<T> {
    case loading
    case withData(T)
    case error(Error)
}
