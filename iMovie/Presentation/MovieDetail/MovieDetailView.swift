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
        ScrollView {
            VStack() {
                RemoteImage(urlString: viewModel.movie?.backdrop_path)
                    .frame(width: 150, height: 225)

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
        .navigationTitle("Movie Detail")
        .task {
            await viewModel.fetchMovieDetails()
        }
    }
}
