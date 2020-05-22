//
//  SearchViewCell.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct SearchViewCell: View {
    let model: SearchCellModel

    var body: some View {
        HStack {
            WebImage(url: self.model.coverUrl)
                .resizable()
                .placeholder(Image(systemName: "play.circle.fill"))
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
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

struct SearchViewCell_Previews: PreviewProvider {
    static let model = SearchCellModel(songName: "a song",
                                       artistName: "An artist",
                                       coverUrlString: "",
                                       trackId: 0)

    static let models: [SearchCellModel] = [
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0),
        SearchCellModel(songName: "a song", artistName: "an artist", coverUrlString: "", trackId: 0)
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
