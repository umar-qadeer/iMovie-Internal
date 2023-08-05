
import Foundation

struct MovieRequest: DataRequest {
    
    var page: Int

    var url: String {
        let baseURL: String = NetworkRoutes.baseURL
        let path: String = NetworkRoutes.EndPoints.movies
        return baseURL + path
    }

    var method: HTTPMethod {
        .get
    }
    
    var queryItems: [String : String] {
        return [
            "api_key":"c9856d0cb57c3f14bf75bdc6c063b8f3",
            "page": "\(page)"
        ]
    }

    func decode(_ data: Data) throws -> MovieResponse {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }
}
