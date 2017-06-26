//
//  RequestError.swift
//  CoreSwift_Carthage
//
//  Created by iOS Developer on 6/27/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//
import Argo
import Curry
import Runes

struct ErrorResponse: Decodable {
    let responseMessage: String
    let responseTitle: String?
    
    init(responseMessage: String, responseTitle: String? = nil) {
        self.responseTitle = responseTitle
        self.responseMessage = responseMessage
    }
    
    static func decode(_ json: JSON) -> Decoded<ErrorResponse> {
        return curry(ErrorResponse.init)
            <^> json <| "message"
            <*> pure(nil)
    }
}

struct RequestError {
    static let defaultErrorHandler: (Int) -> ErrorResponse? = { statusCode in
        return nil;
    }
    static let genericError = ErrorResponse(responseMessage: "Network error. Please try again later")
}

