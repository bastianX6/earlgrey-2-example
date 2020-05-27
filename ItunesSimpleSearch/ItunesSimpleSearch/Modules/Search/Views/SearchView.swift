//
//  SearchView.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$viewModel.text,
                          placeholder: "seach an artist")
                    .accessibility(identifier: SearchViewIdentifiers.searchbar.id)
                self.getView(forState: self.viewModel.state)
            }
            .navigationBarTitle("Itunes Search")
        }
    }

    func getView(forState state: SearchViewState<[SearchCellModel]>) -> some View {
        switch state {
        case .loading:
            return Text("Loading...")
                .frame(minHeight: 0, maxHeight: .infinity)
                .accessibility(identifier: SearchViewIdentifiers.loading.id)
                .eraseToAnyView()
        case let .error(error):
            return Text("Error: \(error.localizedDescription)")
                .frame(minHeight: 0, maxHeight: .infinity)
                .accessibility(identifier: SearchViewIdentifiers.error.id)
                .eraseToAnyView()
        case let .withData(elements):
            if elements.isEmpty {
                return Text("No results")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .accessibility(identifier: SearchViewIdentifiers.empty.id)
                    .eraseToAnyView()
            } else {
                return List {
                    ForEach(elements, id: \.id) { item in
                        NavigationLink(destination: LookupDetailView(trackId: item.trackId)) {
                            SearchViewCell(model: item)
                        }
                        .accessibility(identifier: SearchViewIdentifiers.cell.id)
                        .accessibility(label: Text(item.songName))
                    }
                }
                .eraseToAnyView()
            }

        case .initial:
            return Text("Type an artist or song in search bar")
                .frame(minHeight: 0, maxHeight: .infinity)
                .accessibility(identifier: SearchViewIdentifiers.initial.id)
                .eraseToAnyView()
        }
    }

    enum SearchViewIdentifiers: String {
        case loading
        case error
        case empty
        case initial
        case cell
        case searchbar

        var id: String {
            return "SearchView." + self.rawValue
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView()
        }
    }
}
