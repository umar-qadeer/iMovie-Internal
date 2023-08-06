//
//  AsyncImage.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct RemoteImage: View {
    
    @State private var downloadedImage: UIImage? = nil
    let urlString: String?
    
    var body: some View {
        Group {
            if let image = downloadedImage {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image("movie-placeholder")
                    .resizable()
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let urlString = urlString else {
            return
        }
        
        ImageDownloadService.getImage(urlString: urlString) { image, _ in
            self.downloadedImage = image
        }
    }
}
