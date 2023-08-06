//
//  MoviesModelTest.swift
//  iMovieTests
//
//  Created by Umair Afzal on 06/08/2023.
//

import XCTest
@testable import iMovie

class MoviesModelTest: XCTestCase {

    func testMoviesModel_whenInit_thenInitializesSuccessfully() throws {
        // Given
        let movies = try MockDataGenerator().getMockMovies()

        // When (nothing to do here)

        // Then
        XCTAssertEqual(movies.results.count, 20)
        XCTAssertEqual(movies.results.first?.id, 346698, "First movie's ID should be 346698")
        XCTAssertEqual(movies.results.first?.title, "Barbie", "First movie's title should be Barbie")
        
    }
}

