//
//  ContentView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieListView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(value: movie, label: {
                    MovieListCell(movie: movie)
                })
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Movie.self) { moview in
                MovieDetailView()
            }
            .onAppear{
                viewModel.fetchMovies()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}
