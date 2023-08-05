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
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(value: movie, label: {
                        MovieListCell(movie: movie)
                    })
                }
                
                if viewModel.currentPage < viewModel.totalPages {
                    LoadingCell()
                        .onAppear {
                            viewModel.fetchMovies()
                        }
                }
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Movie.self) { movie in
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
