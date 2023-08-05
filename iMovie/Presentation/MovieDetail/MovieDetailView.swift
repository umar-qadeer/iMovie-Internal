//
//  MovieDetailView.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        ScrollView {
            VStack() {
                RemoteImage(urlString: nil)
                    .frame(height: 250)
                
                VStack(alignment: .leading) {
                    Text("The Shashank Redemption")
                        .bold()
                        .font(.title)
                    
                    Text("1994")
                        .font(.title2)
                    
                    Text("description")
                        .font(.body)
                        .lineLimit(0)
                }
            }
        }
        .navigationTitle("Movie Detail")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
