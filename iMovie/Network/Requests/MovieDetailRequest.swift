
import Foundation

struct MovieDetailRequest: DataRequest {

    let movieId: Int

    var url: String {
        let baseURL: String = NetworkRoutes.baseURL
        let path: String = NetworkRoutes.EndPoints.movieDetail
        return baseURL + path + "\(movieId)"
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> Movie {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Movie.self, from: data)
        return response
    }
}
