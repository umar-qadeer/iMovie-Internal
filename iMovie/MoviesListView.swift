//
//  ContentView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

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

struct MoviesListView: View {
    var movies = Movie.sampleMovies
    
    var body: some View {
        NavigationStack {
            List(movies) { movie in
                MovieListCell(movie: movie)
            }
            .navigationTitle("Movies")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
