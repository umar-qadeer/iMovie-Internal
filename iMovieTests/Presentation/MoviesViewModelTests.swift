//
//  MoviesViewModelTests.swift
//  iMovieTests
//
//  Created by Umair Afzal on 06/08/2023.
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

    func testWhenFetchMoviesRecieveBreeds_thenViewModelBreedsCountIsEqualToNinetySix_succeeds() async {
        // given
        expectation = expectation(description: "Fetch movies list")
        expectation?.expectedFulfillmentCount = 1

        let moviesRepositoryMock = MoviesRepositoryMock()
        let viewModel = MovieListViewModel(moviesRepository: moviesRepositoryMock)

        // when
        await viewModel.fetchMovies()

        DispatchQueue.main.async {
            self.expectation?.fulfill()
        }

        // then
        await waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual((viewModel.movies.count ), 20)
    }
}
