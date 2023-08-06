//
//  EmptyView.swift
//  iMovie
//
//  Created by Muhammad Umar on 06/08/2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Image.movieReel
                    .resizable()
                    .frame(width: 150, height: 150)
                Text(Strings.Error.noData)
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
