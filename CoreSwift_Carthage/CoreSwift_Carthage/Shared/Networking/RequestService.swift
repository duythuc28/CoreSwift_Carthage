//
//  RequestService.swift
//  TimeSheet
//
//  Created by iOS Developer on 4/2/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Moya

enum RequestService {
//    case login(credential: Credential)
//    case forgotPassword(email: String)
//    case hashtag
//    case uploadMedia(media: Media)
//    case validateToken
//    case post(content: PostContent)
//    case mediaList(pagination: PaginationRequest, name: String?)
//    case postList(dateFilter: DateFilter, pagination: PaginationRequest?)
//    case postValidateList(dateFilter: DateFilter, pagination: PaginationRequest?)
//    case deletePost(id: Int)
//    case validatePost(id: Int, content: PostContent)
//    case converseUnreadCount
//    case converseNotificationList(params: ConverseNotificationListRequestParams)
//    case converseNotificationItem(id: Int, socialNetwork: SocialNetwork)
//    case markNotificationAsRead(id: Int, socialNetwork: SocialNetwork)
//    case answerNotification(id: Int, socialNetwork: SocialNetwork, notificationType: ConverseNotificationType, answer: String)
//    case likeNotification(id: Int)
//    case unlikeNotification(id: Int)
//    case hideNotification(id: Int)
//    case showNotification(id: Int)
}

extension RequestService: TargetType {
    var baseURL: URL { return URL(string: APIConstant.BASE_URL)! }
    
    var path: String {
//        switch self {
//        case .login:
//            return "login_check"
//        case .forgotPassword:
//            return "users/pwd/lost.json"
//        case .hashtag:
//            return "hashtag/list"
//        case .uploadMedia:
//            return "media/upload"
//        case .validateToken:
//            return "users/validateToken"
//        case .post:
//            return "post"
//        case .mediaList:
//            return "media/list"
//        case .postList:
//            return "post/list"
//        case .postValidateList:
//            return "post/tovalidate/list"
//        case .deletePost(let id):
//            return "post/\(id)"
//        case .validatePost(let id, _):
//            return "post/\(id)"
//        case .converseNotificationList(let params):
//            return "converse/\(params.socialNetwork.rawValue)/list"
//        case .converseNotificationItem(let id, let socialNetwork):
//            return "converse/\(socialNetwork.rawValue)/\(id)"
//        case .markNotificationAsRead(let id, let socialNetwork):
//            return "converse/\(socialNetwork.rawValue)/markasread/\(id)"
//        case .answerNotification(let id, let socialNetwork, let notificationType, _):
//            switch socialNetwork {
//            case .facebook:
//                return "converse/\(notificationType.rawValue)/\(id)"
//            case .google:
//                return "converse/google/comment/\(id)"
//            }
//        case .likeNotification(let id):
//            return "converse/facebook/like/\(id)"
//        case .unlikeNotification(let id):
//            return "converse/facebook/unlike/\(id)"
//        case .hideNotification(let id):
//            return "converse/facebook/hide/\(id)"
//        case .showNotification(let id):
//            return "converse/facebook/show/\(id)"
//        case .converseUnreadCount:
//            return "converse/count-unread"
        return ""
    }
    
    var method: Moya.Method {
//        switch self {
//        case .login,
//             .forgotPassword,
//             .uploadMedia,
//             .validateToken,
//             .post,
//             .markNotificationAsRead,
//             .answerNotification,
//             .likeNotification,
//             .unlikeNotification,
//             .hideNotification,
//             .showNotification:
//            return .post
//        case .hashtag,
//             .mediaList,
//             .postList,
//             .postValidateList,
//             .converseNotificationList,
//             .converseUnreadCount,
//             .converseNotificationItem:
//            return .get
//        case .deletePost:
//            return .delete
//        case .validatePost:
//            return .put
//        }
        return .get
    }
    
    var parameters: [String: Any]? {
//        switch self {
//        case .login(let credential):
//            return ["_username" : credential.email, "_password": credential.password]
//        case .forgotPassword(let email):
//            return ["username": email]
//        case .post(let content):
//            return content.toDict()
//        case .mediaList(let pagination, let name):
//            guard let name = name else {
//                return pagination.toDict()
//            }
//            return pagination.toDict().dictByConcatinating(["name": name])
//        case .postList(let dateFilter, let pagination), .postValidateList(let dateFilter, let pagination):
//            guard let pagination = pagination else {
//                return dateFilter.toDict()
//            }
//            return dateFilter.toDict().dictByConcatinating(pagination.toDict())
//        case .validatePost(_, let content):
//            var params = content.toDict()
//            params["adminValidate"] = true
//            return params
//        case .converseNotificationList(let params):
//            return params.toDict()
//        case .answerNotification(_, _, _, let answer):
//            return ["answer": answer]
//        default:
//            return nil
//        }
        return nil
    }
    
    var multipartBody: [MultipartFormData]? {
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
        return nil
    }
    
    // Http headers
    var headers: [String: String]? {
//        switch self {
//        case .login, .forgotPassword:
//            return nil
////        case .post:
////            return ["Authorization": "Bearer \(UserManager.token ?? "")", "Content-Type": "application/x-www-form-urlencoded"]
//        default:
//            return ["Authorization": "Bearer \(UserManager.token ?? "")"]
//        }
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
//        switch self {
////        case .post:
////            return URLEncoding.default
//        default:
//             return JSONEncoding.default
//        }
        return URLEncoding.default
    }
    
    var sampleData: Data {
//        switch self {
//        case .forgotPassword:
//            return "{\"message\": \"Reset password success\"}".utf8Encoded
//        default:
//            return "Half measures are as bad as nothing at all.".utf8Encoded
//        }
         return "Half measures are as bad as nothing at all.".utf8Encoded
    }
    
    var task: Task {
        //        switch self {
        //        case .uploadMedia:
        //            if let multipartBody = self.multipartBody {
        //                return .upload(.multipart(multipartBody))
        //            }
        //            fallthrough
        //        default:
        //            return .request
        //        }
        return .request
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
