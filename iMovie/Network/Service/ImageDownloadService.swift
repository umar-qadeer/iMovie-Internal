
import UIKit

final class ImageDownloadService {
    private static var imageCache = NSCache<AnyObject, AnyObject>()
    
    class func getImage(urlString: String?, completion: @escaping (UIImage?, String?) -> ()) {
        
        guard let urlString = urlString else {
            DispatchQueue.main.async(execute: { () -> Void in
                completion(nil, nil)
            })
            return
        }
        
        if let image = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            completion(image, urlString)
            
        } else {
            
            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) {(data, response, error) in
                    if error == nil,
                       let data = data,
                       let image = UIImage(data: data) {
                        self.imageCache.setObject(image, forKey: (urlString as AnyObject))
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            completion(image, urlString)
                        })
                    } else {
                        DispatchQueue.main.async(execute: { () -> Void in
                            completion(nil, nil)
                        })
                    }
                }.resume()
                
            } else {
                DispatchQueue.main.async(execute: { () -> Void in
                    completion(nil, nil)
                })
            }
        }
    }
}
