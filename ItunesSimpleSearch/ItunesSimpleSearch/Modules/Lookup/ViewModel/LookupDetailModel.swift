//
//  LookupDetailModel.swift
//  ItunesSimpleSearch
//
//  Created by Bastián Véliz Vega on 21-05-20.
//  Copyright © 2020 Bastián Véliz Vega. All rights reserved.
//

import Foundation

struct LookupDetailModel: Identifiable {
    let id = UUID()

    let artistName: String
    let songName: String
    let albumName: String
    let coverUrlString: String
    var coverUrl: URL? {
        return URL(string: self.coverUrlString)
    }

    init(artistName: String,
         songName: String,
         albumName: String,
         coverUrlString: String) {
        self.artistName = artistName
        self.songName = songName
        self.albumName = albumName
        self.coverUrlString = coverUrlString
    }

    init?(entity: ItunesEntity) {
        guard let artistName = entity.artistName,
            let songName = entity.trackName,
            let albumName = entity.collectionName,
            let coverUrlString = entity.artworkUrl100 else {
            return nil
        }
        self.artistName = artistName
        self.songName = songName
        self.albumName = albumName
        self.coverUrlString = coverUrlString
    }
}
