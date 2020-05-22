//
//  LookupDetailView.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct LookupDetailView: View {
    @ObservedObject private var viewModel: LookupViewModel
    let trackId: Int64

    init(trackId: Int64, viewModel: LookupViewModel = LookupViewModel()) {
        self.trackId = trackId
        self.viewModel = viewModel
    }

    var body: some View {
        self.getView(forState: self.viewModel.state)
            .onAppear {
                self.viewModel.loadDetail(trackId: self.trackId)
            }
    }

    func getView(forState state: LookupViewState<LookupDetailModel>) -> some View {
        switch state {
        case .loading:
            return Text("Loading...")
                .frame(minHeight: 0, maxHeight: .infinity)
                .eraseToAnyView()
        case let .error(error):
            return Text("Error: \(error.localizedDescription)")
                .frame(minHeight: 0, maxHeight: .infinity)
                .eraseToAnyView()
        case let .withData(model):
            return self.getDetailView(model: model)
                .eraseToAnyView()
        }
    }

    func getDetailView(model: LookupDetailModel) -> some View {
        ScrollView {
            VStack {
                WebImage(url: model.coverUrl)
                    .resizable()
                    .placeholder(Image(systemName: "play.circle.fill"))
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                Text(model.songName)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text(model.albumName)
                    .italic()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text(model.artistName)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct LookupDetailView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = LookupViewModel(repository: PreviewLookupRepository())

    static let trackId: Int64 = 804_145_419
    static var previews: some View {
        Group {
            LookupDetailView(trackId: self.trackId)
            LookupDetailView(trackId: self.trackId, viewModel: self.viewModel)
        }
    }

    class PreviewLookupRepository: LookupRepositoryProtocol {
        func getDetail(id _: Int64,
                       completion: @escaping (Result<LookupDetailModel, Error>) -> Void) {
            let model = LookupDetailModel(artistName: "an artist",
                                          songName: "this is a song",
                                          albumName: "great album",
                                          coverUrlString: "")
            completion(.success(model))
        }

        func cancelPreviousSearch() {}
    }
}
