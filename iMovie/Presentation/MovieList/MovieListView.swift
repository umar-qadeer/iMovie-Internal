//
//  ContentView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(
                        destination: makeDetailView(for: movie),
                        label: {
                            MovieListCell(movie: movie)
                                .id(movie)
                        }
                    )
                }
                
                if viewModel.currentPage < viewModel.totalPages {
                    LoadingCell()
                        .task {
                            await viewModel.fetchMovies()
                        }
                }
            }
            .navigationTitle("Movies")
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
    
    func makeDetailView(for movie: Movie) -> some View {
        let appDIContainer = AppDIContainer()
        let diContainer = appDIContainer.makeMovieDetailsDIContainer(movieId: "\(movie.id)")
        return diContainer.makeMovieDetailsSwiftUIView()
    }
}
