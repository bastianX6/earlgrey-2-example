//
//  SearchView.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var models: [SearchCellModel] = []

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$searchText, placeholder: "seach an artist")
                List {
                    ForEach(self.models, id: \.id) { item in
                        SearchViewCell(model: item)
                    }
                }
            }
            .navigationBarTitle("Itunes Search")
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
