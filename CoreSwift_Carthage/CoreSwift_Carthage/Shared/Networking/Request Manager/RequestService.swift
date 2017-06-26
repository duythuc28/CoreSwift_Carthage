//
//  RequestService.swift
//  CoreSwift_Carthage
//
//  Created by iOS Developer on 6/27/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Moya

enum RequestService {
    case login(credential: Credential)
    case forgotPassword(email: String)
}

extension RequestService: TargetType {
    
    var baseURL: URL { return URL(string: APIConstant.BASE_URL)! }
    
    var path: String {
        switch self {
        case .login:
            return "login_check"
        case .forgotPassword:
            return "users/pwd/lost.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login,
             .forgotPassword:
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .login(let credential):
            return ["_username" : credential.email, "_password": credential.password]
        case .forgotPassword(let email):
            return ["username": email]
        }
    }
    
    //    var multipartBody: [MultipartFormData]? {
    //        switch self {
    //        case .uploadMedia(let media):
    //            guard let file = media.file else { return nil }
    //            switch media.type {
    //            case .image:
    //                return [MultipartFormData(provider: .data(file), name: "file", fileName: media.name,
    //                                          mimeType: "image/jpeg")]
    //            case .video:
    //                return [MultipartFormData(provider: .data(file), name: "file", fileName: media.name,
    //                                          mimeType: "video/quicktime")]
    //            }
    //        default:
    //            return nil
    //        }
    //    }
    //
    
    // Http headers
    var headers: [String: String]? {
//        switch self {
//        case .login, .forgotPassword:
//            return nil
//            //        case .post:
//            //            return ["Authorization": "Bearer \(UserManager.token ?? "")", "Content-Type": "application/x-www-form-urlencoded"]
//            //        default:
//            //            return ["Authorization": "Bearer \(UserManager.token ?? "")"]
//        }
        return nil
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    
//    var parameterEncoding: ParameterEncoding {
////        switch self {
////            //        case .post:
////        //            return URLEncoding.default
////        default:
////            return JSONEncoding.default
////        }
//        return JSONEncoding.default
//    }
//    
    var sampleData: Data {
        switch self {
        case .forgotPassword:
            return "{\"message\": \"Reset password success\"}".utf8Encoded
        default:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
//        case .uploadMedia:
//            if let multipartBody = self.multipartBody {
//                return .upload(.multipart(multipartBody))
//            }
//            fallthrough
//        default:
//            return .request
        case .forgotPassword, .login:
            return .request
        }
    }
}
