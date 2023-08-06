//
//  RemoteImage.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import SwiftUI

enum ImageQuality: String {
    case normal = "w300"
    case hq = "w1280"
}

struct RemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    var urlString: String?
    var imageQualty: ImageQuality = .normal
    
    var body: some View {
        ResizableImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString, imageQuality: imageQualty)
            }
    }
}

struct ResizableImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image.moviePlaceholder.resizable()
    }
}

@MainActor final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String?, imageQuality: ImageQuality) {
        guard let urlString else { return }
        
        let imageURLString = NetworkRoutes.imageBaseURL + imageQuality.rawValue + urlString
        
        Task {
            if let uiImage = await ImageDownloadService.getImage(fromUrlString: imageURLString) {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
