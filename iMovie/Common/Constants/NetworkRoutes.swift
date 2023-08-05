
import Foundation

final class NetworkRoutes {
    // API base url
    static let baseURL: String = "https://api.themoviedb.org/3/"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/original"

    struct EndPoints {
        static let movies = "discover/movie"
        static let breedImages = "breed/%@/images"
    }
}
