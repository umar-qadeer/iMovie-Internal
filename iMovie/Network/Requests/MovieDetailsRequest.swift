//
//  MovieDetailsRequest.swift
//  iMovie
//
//  Created by Umair Afzal on 05/08/2023.
//

import Foundation

struct MovieDetailsRequest: DataRequest {

    let movieId: String

    var url: String {
        let baseURL: String = NetworkRoutes.baseURL
        let path: String = NetworkRoutes.EndPoints.movieDetails
        return baseURL + path + movieId
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
