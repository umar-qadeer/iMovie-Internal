
import UIKit

final class ImageDownloadService {
    private static var imageCache = NSCache<NSString, UIImage>()
    
    class func getImage(fromUrlString urlString: String, completion: @escaping (UIImage?) -> ()) {
        let cacheKey = NSString(string: urlString)
        
        if let image = imageCache.object(forKey: cacheKey) {
            completion(image)
        } else {
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) {(data, response, error) in
                    if error == nil,
                       let data = data,
                       let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: (cacheKey))
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }.resume()
            } else {
                completion(nil)
            }
        }
    }
}
