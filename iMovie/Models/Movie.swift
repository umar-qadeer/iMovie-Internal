//
//  Movie.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}

struct Movie: Codable, Hashable, Identifiable {
    let id: Int
    let backdrop_path: String?
    let homepage: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let title: String?
}
