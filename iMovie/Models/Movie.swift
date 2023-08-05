//
//  Movie.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var year: Int
}

extension Movie {
    static let sampleMovie = Movie(image: "movie-placeholder", title: "Shashank Redemption", year: 1994)
    
    static let sampleMovies = [
        Movie(image: "movie-placeholder", title: "Shashank Redemption", year: 1994),
        Movie(image: "movie-placeholder", title: "Shashank Redemption", year: 1994),
        Movie(image: "movie-placeholder", title: "Shashank Redemption", year: 1994)
    ]
}
