//
//  Strings.swift
//  iMovie
//
//  Created by Muhammad Umar on 05/08/2023.
//

import Foundation

struct Strings {
    
    struct Titles {
        static let movies = "Movies"
        static let movieDetail = "Movie Detail"
    }
    
    struct Alert {
        static let error =  "Error"
        static let okay =  "Okay"
    }
    
    struct Error {
        static let general = "Unexpected error occurred. Please try again."
        static let noInternet = "Please check your internet connection."
        static let apiError = "There is something wrong with the api."
        static let invalidQueryItems = "Invalid query params provided."
        static let invalidParameter = "Invalid parameter provided."
        static let invalidResponse = "Unable to handle the response."
        static let invalidEndpoint = "Invalid end point provided."
        static let noData = "Data not available."
    }
}
