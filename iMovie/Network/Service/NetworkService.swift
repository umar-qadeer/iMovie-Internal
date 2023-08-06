//
//  NetworkService.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

protocol NetworkService: AnyObject {
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response
}

final class DefaultNetworkService: NetworkService {
    
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response {
        
        guard Reachability.isConnectedToNetwork() else {
            throw NSError.createNetworkError()
        }
        
        guard var urlComponent = URLComponents(string: request.url) else {
            throw NSError.createError(ofType: ErrorResponse.invalidEndpoint)
        }
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in request.queryItems {
            let urlQueryItem = URLQueryItem(name: key, value: value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            throw NSError.createError(ofType: ErrorResponse.invalidQueryItems)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        if request.method == .post {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch {
                throw error
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NSError.createError(ofType: ErrorResponse.invalidResponse)
        }

        do {
            let decodedData = try request.decode(data)
            return decodedData
        } catch {
            throw error
        }
    }
}
