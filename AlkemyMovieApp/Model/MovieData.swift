//
//  MovieData.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 19/03/2022.
//

import Foundation

struct MovieData: Codable {
    let results: [Movies]
}

struct Movies: Codable {
    let backdrop_path: String?
    let poster_path: String?
    let id: Double?
    let title: String?
    let overview: String?
    let vote_average: Double?
    let release_date: String?
    let original_language: String?
    let genre_ids: [Int]?
}

struct MovieFavs: Codable {
    let backdrop_path: String?
    let poster_path: String?
    let id: Double?
    let title: String?
    let overview: String?
    let vote_average: Double?
    let release_date: String?
    let original_language: String?
    let genres: [Genres]?
}

struct Genres: Codable {
    let id: Int
}
