//
//  MoviesViewModelTests.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import XCTest
@testable import iMovie

final class MoviesViewModelTests: XCTestCase {
    
    var expectation: XCTestExpectation?

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        expectation = nil

        try super.tearDownWithError()
    }

    func testWhenFetchMoviesRecieveMovies_thenViewModelMoviesCountIsEqualToTwenty_succeeds() async {
        // given
        expectation = expectation(description: "Fetch movies list")
        expectation?.expectedFulfillmentCount = 1

        let moviesRepositoryMock = MoviesRepositoryMock()
        let viewModel = await MovieListViewModel(moviesRepository: moviesRepositoryMock)

        // when
        await viewModel.fetchMovies()
        self.expectation?.fulfill()

        // then
        await waitForExpectations(timeout: 5, handler: nil)

        // Access 'movies' property within a main actor context
        await MainActor.run {
            XCTAssertEqual(viewModel.movies.count, 20)
        }
    }
}
