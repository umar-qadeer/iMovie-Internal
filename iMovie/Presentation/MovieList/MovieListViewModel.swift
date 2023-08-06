//
//  MovieListViewModel.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

@MainActor final class MovieListViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var movies = [Movie]()
    @Published var isErrorPresented = false
    @Published var isLoading = false
    private let moviesRepository: MoviesRepositoryProtocol?
    var currentPage = 1
    var totalPages = 1
    var error: Error?

    // MARK: - Initializers
    
    init(moviesRepository: MoviesRepositoryProtocol) {
        self.moviesRepository = moviesRepository
    }

    // MARK: - Functions
    
    func fetchMovies() {
        guard !isLoading, currentPage <= totalPages else {
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let response = try await moviesRepository?.fetchMovies(page: currentPage)
                self.currentPage += 1
                
                if let response {
                    self.totalPages = response.total_pages
                    self.movies.append(contentsOf: response.results)
                }
            } catch {
                self.error = error
                self.isErrorPresented = true
            }
            
            self.isLoading = false
        }
    }
}

