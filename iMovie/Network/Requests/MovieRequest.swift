
import Foundation

struct MovieRequest: DataRequest {

    var url: String {
        let baseURL: String = NetworkRoutes.baseURL
        let path: String = NetworkRoutes.EndPoints.movies
        return baseURL + path
    }

    var method: HTTPMethod {
        .get
    }

    func decode(_ data: Data) throws -> MovieResponse {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }
}
