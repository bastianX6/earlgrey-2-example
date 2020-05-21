//
//  SearchViewCell.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import SwiftUI

struct SearchViewCell: View {
    let model: SearchCellModel

    var body: some View {
        HStack {
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            VStack {
                Text(self.model.songName)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .leading)
                Text(self.model.artistName)
                    .bold()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           alignment: .leading)
            }
        }
    }
}

struct SearchCellModel: Identifiable {
    let songName: String
    let artistName: String
    let coverUrl: String
    let id: UUID = UUID()
}

struct SearchViewCell_Previews: PreviewProvider {
    static let model = SearchCellModel(songName: "a song",
                                       artistName: "An artist",
                                       coverUrl: "")

    static let models: [SearchCellModel] = [
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: ""),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: ""),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: ""),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: ""),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: ""),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrl: "")
    ]

    static var previews: some View {
        Group {
            SearchViewCell(model: self.model)

            List {
                ForEach(self.models, id: \.id) { item in
                    SearchViewCell(model: item)
                }
            }
        }
    }
}
