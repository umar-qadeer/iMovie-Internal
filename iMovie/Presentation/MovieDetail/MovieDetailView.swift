//
//  MovieDetailView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var viewModel: MovieDetailsViewModel

    var body: some View {
        ZStack {
            ScrollView {
                GeometryReader { geometry in
                    VStack() {
                        RemoteImage(urlString: viewModel.movie?.backdrop_path, imageQualty: .hq)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.width * 9/16)
                            .id(viewModel.movie)
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.movie?.title ?? "-")
                                .bold()
                                .font(.title)
                            
                            Text(viewModel.movie?.release_date ?? "-")
                                .font(.title2)
                            
                            Text(viewModel.movie?.overview ?? "")
                                .font(.body)
                                .lineLimit(0)
                        }
                    }
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .navigationTitle(Strings.Titles.movieDetail)
        .onAppear {
            viewModel.fetchMovieDetail()
        }
        .alert(Strings.Alert.error, isPresented: $viewModel.isErrorPresented, actions: {
            Button(Strings.Alert.okay, role: .cancel) { }
        }, message: {
            Text(viewModel.error?.localizedDescription ?? "")
        })
    }
}
