//
//  SearchCellModel.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

struct SearchCellModel: Identifiable {
    let id: UUID = UUID()

    let songName: String
    let artistName: String
    let coverUrlString: String
    let trackId: Int64
    var coverUrl: URL? {
        return URL(string: self.coverUrlString)
    }

    init(songName: String,
         artistName: String,
         coverUrlString: String,
         trackId: Int64) {
        self.songName = songName
        self.artistName = artistName
        self.coverUrlString = coverUrlString
        self.trackId = trackId
    }

    init?(entity: ItunesEntity) {
        guard let songName = entity.trackName,
            let artistName = entity.artistName,
            let coverUrl = entity.artworkUrl60,
            let trackId = entity.trackId else {
            return nil
        }
        self.songName = songName
        self.artistName = artistName
        self.coverUrlString = coverUrl
        self.trackId = trackId
    }
}
