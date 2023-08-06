//
//  DataRequest.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol DataRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    var body: [String: Any?] { get }
    
    func decode(_ data: Data) throws -> Response
}

extension DataRequest {
    
    var headers: [String : String] {
        return [:]
    }
    
    var queryItems: [String : String] {
        return ["api_key": NetworkRoutes.apiKey]
    }
    
    var body: [String: Any?] {
        return [:]
    }
}

extension DataRequest where Response: Decodable {

    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(Response.self, from: data)
        return decoded
    }
}
