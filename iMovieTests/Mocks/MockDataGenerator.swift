//
//  MockDataGenerator.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation
@testable import iMovie

final class MockDataGenerator {
    
    // MARK: - Properties
    
    lazy var bundle: Bundle = {
        return Bundle(for: type(of: self))
    }()

    // MARK: - Functions

    func getMockMovies() throws -> MovieResponse {
        let data = try Data(contentsOf: bundle.url(forResource: "sampleData", withExtension: "json")!)
        let decoder = JSONDecoder()
        let response = try decoder.decode(MovieResponse.self, from: data)
        return response
    }

    func getMockMovie(id: Int) throws -> Movie {
        let movies = try getMockMovies().results
        return movies.first(where: {$0.id == id})!
    }

    func getMockMoviesData() -> Data? {
        
        if let url = bundle.url(forResource: "sampleData", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print(error)
            }
        }
        
        return nil
    }
}

