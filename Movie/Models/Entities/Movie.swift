//
//  Movie.swift
//  Movie
//
//  Created by Lucas Pelizza on 3/28/18.
//  Copyright © 2018 Lucas E Pelizza. All rights reserved.
//

import Mapper

struct Movie: Mappable {
    typealias ObjectIdType = Int
    let identifier: ObjectIdType
    let posterPath: String
    let isAdult: Bool
    let overview: String
    let releaseDate: String
    let genreIDs: [Int]
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String
    let popularity: Float
    let voteCount: Int
    let video: Bool
    let voteAverage: Float
    
    init(map: Mapper) throws {
        try identifier = map.from("id")
        try posterPath = map.from("poster_path")
        try isAdult = map.from("adult")
        try overview = map.from("overview")
        try releaseDate = map.from("release_date")
        try genreIDs = map.from("genre_ids")
        try originalTitle = map.from("original_title")
        try originalLanguage = map.from("original_language")
        try title = map.from("title")
        try backdropPath = map.from("backdrop_path")
        try popularity = map.from("popularity")
        try voteCount = map.from("vote_count")
        try video = map.from("video")
        try voteAverage = map.from("vote_average")
    }
}
