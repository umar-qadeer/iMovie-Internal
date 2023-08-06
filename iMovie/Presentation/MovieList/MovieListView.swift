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
        
        ZStack {
            NavigationStack {
                List {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(
                            destination: makeDetailView(for: movie),
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
                .navigationTitle(Strings.Titles.movies)
            }
            .onAppear {
                viewModel.fetchMovies()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(Strings.Alert.error, isPresented: $viewModel.isErrorPresented, actions: {
            Button(Strings.Alert.okay, role: .cancel) { }
        }, message: {
            Text(viewModel.error?.localizedDescription ?? "")
        })
    }
    
    func makeDetailView(for movie: Movie) -> some View {
        let appDIContainer = AppDIContainer()
        let diContainer = appDIContainer.makeMovieDetailsDIContainer(movieId: movie.id)
        return diContainer.makeMovieDetailsSwiftUIView()
    }
}
