
import Foundation

final class NetworkRoutes {
    // API base url
    static let baseURL: String = "https://api.themoviedb.org/3/"

    struct EndPoints {
        static let movies = "discover/movie"
        static let breedImages = "breed/%@/images"
    }
}
