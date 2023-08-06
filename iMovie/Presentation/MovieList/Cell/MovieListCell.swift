//
//  MovieListCell.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieListCell: View {
    
    let movie: Movie

    var body: some View {
        HStack {
            RemoteImage(urlString: movie.poster_path)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(movie.title ?? "")
                    .bold()
                    .font(.title2)
                Text("\(movie.release_date ?? "")")
            }
        }
    }
}
