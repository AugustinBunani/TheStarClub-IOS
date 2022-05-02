//
//  ApiError.swift
//  TheStarClub
//
//  Created by Augustin Bunani on 2/5/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible{
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String{
        //User feedback
        switch self{
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong"
        case .badResponse(_):
            return "Sorry, the connection to our server failed"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    var description: String{
        //infor for debugging
        switch self{
        case .unknown:
            return "Sorry, unknown error"
        case .badURL:
            return "Sorry, INVALID URL"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? " ")"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .badResponse(statusCode: let statusCode):
            return "bad respone with status code \(statusCode)"
        }
    }
    
}

