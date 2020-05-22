//
//  SearchCellModel.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

struct SearchCellModel: Identifiable {
    let songName: String
    let artistName: String
    let coverUrl: String
    let id: UUID = UUID()

    init(songName: String, artistName: String, coverUrl: String) {
        self.songName = songName
        self.artistName = artistName
        self.coverUrl = coverUrl
    }

    init?(entity: ItunesEntity) {
        guard let songName = entity.trackName,
            let artistName = entity.artistName,
            let coverUrl = entity.artworkUrl60 else {
            return nil
        }
        self.songName = songName
        self.artistName = artistName
        self.coverUrl = coverUrl
    }
}
