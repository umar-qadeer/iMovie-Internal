//
//  MovieDetailView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var viewModel: MovieDetailViewModel

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack() {
                        // Calculating frame using geometry to match image resolution and make it aspect fit nicely
                        ZStack {
                            Color.mercuryGray
                            
                            RemoteImage(urlString: viewModel.movie?.backdrop_path, imageQualty: .hq)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.width * 9/16)
                                .id(viewModel.movie)
                        }
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(viewModel.movie?.title ?? "")
                                    .bold()
                                    .font(.title)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Text(viewModel.movie?.release_date ?? "")
                                    .font(.title2)
                            }
                            
                            Spacer()
                            
                            RemoteImage(urlString: viewModel.movie?.poster_path)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 150)
                                .id(viewModel.movie)
                                .cornerRadius(8)
                        }
                        .padding()
                        
                        Text(viewModel.movie?.overview ?? "")
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        
                        if let homePageURLString = viewModel.movie?.homepage,
                           let url = URL(string: homePageURLString) {
                            Link(destination: url, label: {
                                MovieButton(title: "View in Safari")
                            })
                            .padding(.bottom, 20)
                        }
                    }
                }
            }
            
            if viewModel.movie == nil {
                EmptyView()
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
