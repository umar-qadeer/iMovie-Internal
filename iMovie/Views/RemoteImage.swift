//
//  RemoteImage.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

struct RemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String?
    
    var body: some View {
        ResizableImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}

struct ResizableImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("movie-placeholder").resizable()
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String?) {
        guard let urlString else { return }
        
        let imageURLString = NetworkRoutes.imageBaseURL + urlString
        
        ImageDownloadService.getImage(fromUrlString: imageURLString) { uiImage in
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
