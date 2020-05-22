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
                SearchBar(text: self.$viewModel.text, placeholder: "seach an artist")
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
                .eraseToAnyView()
        case let .error(error):
            return Text("Error: \(error.localizedDescription)")
                .frame(minHeight: 0, maxHeight: .infinity)
                .eraseToAnyView()
        case let .withData(elements):
            if elements.isEmpty {
                return Text("No results")
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .eraseToAnyView()
            } else {
                return List {
                    ForEach(elements, id: \.id) { item in
                        NavigationLink(destination: LookupDetailView(trackId: item.trackId)) {
                            SearchViewCell(model: item)
                        }
                    }
                }
                .eraseToAnyView()
            }

        case .initial:
            return Text("Type an artist or song in search bar")
                .frame(minHeight: 0, maxHeight: .infinity)
                .eraseToAnyView()
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
