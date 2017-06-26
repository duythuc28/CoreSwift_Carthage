//
//  RequestModel.swift
//  CoreSwift_Carthage
//
//  Created by iOS Developer on 6/27/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Argo
import Runes
import Curry


typealias JSONDictionary = [String: Any]

enum Result<Value> {
    case success(Value)
    case failure(ErrorResponse)
}

struct Credential {
    let email: String
    let password: String
}

struct Token: Decodable {
    let token: String
    static func decode(_ json: JSON) -> Decoded<Token> {
        return curry(Token.init)
        <^> json <| "token"
    }
}

//extension Token {
//    init?(json: JSONDictionary) {
//        guard let token = json["token"] as? String else {
//            return nil
//        }
//        self.token = token
//    }
//}
