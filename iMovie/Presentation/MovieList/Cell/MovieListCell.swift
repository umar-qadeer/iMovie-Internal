//
//  MovieListCell.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieListCell: View {
    
    @State var movie: Movie

    var body: some View {
        HStack {
            RemoteImage(urlString: NetworkRoutes.imageBaseURL + (movie.poster_path ?? ""))
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
                .id(movie)

            VStack(alignment: .leading) {
                Text(movie.title ?? "")
                Text("\(movie.release_date ?? "")")
            }
        }
    }
}
