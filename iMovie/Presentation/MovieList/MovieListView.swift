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
            ZStack {
                List {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(
                            destination: getDetailView(for: movie),
                            label: {
                                MovieListCell(movie: movie)
                            }
                        )
                    }
                    
                    if viewModel.currentPage < viewModel.totalPages {
                        LoadingCell()
                            .onAppear {
                                viewModel.fetchMovies()
                            }
                    }
                }
                
                if viewModel.movies.isEmpty {
                    EmptyView()
                }
                
                if viewModel.isLoading && viewModel.currentPage == 1 {
                    LoadingView()
                }
            }
            .navigationTitle(Strings.Titles.movies)
            .onAppear {
                viewModel.fetchMovies()
            }
        }
        .alert(Strings.Alert.error, isPresented: $viewModel.isErrorPresented, actions: {
            Button(Strings.Alert.okay, role: .cancel) { }
        }, message: {
            Text(viewModel.error?.localizedDescription ?? "")
        })
    }
    
    func getDetailView(for movie: Movie) -> some View {
        let appDIContainer = AppDIContainer()
        let diContainer = appDIContainer.makeMovieDetailDIContainer(movieId: movie.id)
        return diContainer.makeMovieDetailView()
    }
}
