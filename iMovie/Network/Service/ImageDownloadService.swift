//
//  ImageDownloadService.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import UIKit

final class ImageDownloadService {
    
    private static var imageCache = NSCache<NSString, UIImage>()
    
    class func getImage(fromUrlString urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = imageCache.object(forKey: cacheKey) {
            return image
        } else {
            if let url = URL(string: urlString) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: cacheKey)
                        return image
                    }
                } catch {
                    // Just printing it because it is not important to show error to user. Placeholder will be shown if an image is not downloaded for any reason.
                    print(error.localizedDescription)
                }
            }
        }
        
        return nil
    }
}

