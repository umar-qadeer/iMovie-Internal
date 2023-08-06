//
//  NetworkRoutes.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

final class NetworkRoutes {
    // API base url
    static let baseURL: String = "https://api.themoviedb.org/3/"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/"
    static let apiKey: String = "c9856d0cb57c3f14bf75bdc6c063b8f3"

    struct EndPoints {
        static let movies = "discover/movie"
        static let movieDetail = "movie/"
    }
}
