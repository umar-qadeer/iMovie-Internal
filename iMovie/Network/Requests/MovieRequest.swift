//
//  MovieRequest.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

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
            "api_key": NetworkRoutes.apiKey,
            "page": "\(page)"
        ]
    }

    func decode(_ data: Data) throws -> MovieResponse {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }
}
