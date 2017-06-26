//
//  RequestManager.swift
//  TimeSheet
//
//  Created by iOS Developer on 4/2/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Moya
import Argo

private let genericError = ErrorResponse(responseMessage: "common_error_message".localized)

enum Result<Value> {
    case success(Value)
    case failure(ErrorResponse)
}

// Custom closure to add http headers to endpoints
let endpointClosure = { (target: RequestService) -> Endpoint<RequestService> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    let sampleDataClosure: () -> EndpointSampleResponse = { .networkResponse(200, target.sampleData) }
    var endpoint = Endpoint<RequestService>(url: url, sampleResponseClosure: sampleDataClosure, method: target.method, parameters: target.parameters)
    if let headers = target.headers {
        endpoint = endpoint.adding(newHTTPHeaderFields: headers)
    }
    return endpoint
}

let provider = MoyaProvider<RequestService>(endpointClosure: endpointClosure, manager: DefaultRequestManager.shared)//, plugins: [NetworkLoggerPlugin(verbose: true)])
let uploadProvider = MoyaProvider<RequestService>(endpointClosure: endpointClosure, manager: UploadMediaManager.shared)


final class RequestManager {
    private init () {}
    
    // MARK: - Shared Instance
    static let shared: RequestManager = RequestManager()
    
    // MARK: - Request methods
//    func login(credential: Credential, completion: @escaping (_ result: Result<Token>) -> Void) {
//        request(target: .login(credential:credential), responseType: Token.self, responseHandler: { json -> Token? in
//            if let dictionary = json as? JSONDictionary, let token = Token(json: dictionary), let user: User = decode(json) {
//                UserManager.cachedUser(userData: user)
//                return token
//            }
//            return nil
//        }, completion: completion)
//    }
//    
//    func forgotPassword(email: String, completion: @escaping (_ result: Result<String>) -> Void) {
//        request(target: .forgotPassword(email: email), responseType: String.self, responseHandler: { json -> String? in
//            if let dictionary = json as? JSONDictionary, let message = dictionary["message"] as? String {
//                return message
//            }
//            return nil
//        }, errorHandler: { statusCode -> ErrorResponse? in
//            var errorResponse: ErrorResponse? = nil
//            switch statusCode {
//            case 404:
//                errorResponse = ErrorResponse(responseMessage: "common_user_not_found".localized)
//            case 423:
//                errorResponse = ErrorResponse(responseMessage: "common_user_already_requested".localized)
//            default:
//                break
//            }
//            return errorResponse
//        }, completion: completion)
//    }
//    
//    func getHashTag(completion: @escaping (_ result: Result<Hashtag>) -> Void) {
//        requestDecodable(target: .hashtag,
//                         responseType: Hashtag.self,
//                         completion: completion)
//    }
//    
//    func validateToken(completion: @escaping (_ result: Result<String>) -> Void) {
//        request(target: .validateToken, responseType: String.self, responseHandler: { json -> String? in
//            if let dictionary = json as? JSONDictionary, let message = dictionary["success"] as? String {
//                return message
//            }
//            return nil
//        }, completion: completion)
//    }
//    
//    func uploadMedia(media: Media, progress: Moya.ProgressBlock? = nil, completion: @escaping (_ result: Result<UploadMedia>) -> Void) -> Cancellable {
//        return requestDecodable(target: .uploadMedia(media: media),
//                                responseType: UploadMedia.self,
//                                progressHandler: progress,
//                                completion: completion)
//    }
//    
//    func post(content: PostContent, completion: @escaping (_ result: Result<PostResponse>) -> Void) {
//        requestDecodable(target: .post(content: content),
//                         responseType: PostResponse.self,
//                         errorHandler: { statusCode -> ErrorResponse? in
//                             var errorResponse: ErrorResponse? = nil
//                             switch statusCode {
//                             case 550:
//                                 errorResponse = ErrorResponse(responseMessage: "publish_facebook_limitation".localized)
//                             default:
//                                 errorResponse = ErrorResponse(responseMessage: "common_post_api_unsuccess".localized)
//                             }
//                             return errorResponse
//                         },
//                         completion: completion)
//    }
//    
//    @discardableResult func getMediaList(pagination: PaginationRequest,
//                                         name: String? = nil,
//                                         completion: @escaping (_ result: Result<MediaListResponse>) -> Void) -> Cancellable
//    {
//        return requestDecodable(target: .mediaList(pagination: pagination, name: name),
//                                responseType: MediaListResponse.self,
//                                completion: completion)
//    }
//    
//    func getPostList(dateFilter: DateFilter = DateFilter(),
//                     pagination: PaginationRequest,
//                     completion: @escaping (_ result: Result<FacebookPostList>) -> Void)
//    {
//        requestDecodable(target: .postList(dateFilter: dateFilter, pagination: pagination),
//                         responseType: FacebookPostList.self,
//                         completion: completion)
//    }
//    
//    func getPostValidateList(dateFilter: DateFilter = DateFilter(),
//                             pagination: PaginationRequest? = nil,
//                             completion: @escaping (_ result: Result<FacebookPostList>) -> Void)
//    {
//        requestDecodable(target: .postValidateList(dateFilter: dateFilter, pagination: pagination),
//                         responseType: FacebookPostList.self,
//                         completion: completion)
//    }
//    
//    func deletePost(id: Int, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .deletePost(id: id),
//                    completion: completion)
//    }
//    
//    func validatePost(id: Int, content: PostContent, completion: @escaping (_ result: Result<PostResponse>) -> Void) {
//        requestDecodable(target: .validatePost(id: id, content: content),
//                         responseType: PostResponse.self,
//                         completion: completion)
//    }
//    
//    func getConverseNotificationList<T: ConverseNotificationList>(type: T.Type,
//                                                                  params: ConverseNotificationListRequestParams,
//                                                                  completion: @escaping (_ result: Result<T>) -> Void) where T.DecodedType == T
//    {
//        requestDecodable(target: .converseNotificationList(params: params),
//                         responseType: type,
//                         completion: completion)
//    }
//    
//    func getConverseNotificationItem<T: ConverseNotificationItem>(type: T.Type,
//                                     id: Int,
//                                     socialNetwork: SocialNetwork,
//                                     completion: @escaping (_ result: Result<T>) -> Void) where T.DecodedType == T {
//        
//        requestDecodable(target: .converseNotificationItem(id: id, socialNetwork: socialNetwork),
//                         responseType: type,
//                         completion: completion)
//    }
//    
//    func markNotificationAsRead(id: Int, socialNetwork: SocialNetwork, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .markNotificationAsRead(id: id, socialNetwork: socialNetwork),
//                    completion: completion)
//    }
//    
//    func answerNotification(id: Int,
//                            socialNetwork: SocialNetwork,
//                            notificationType: ConverseNotificationType,
//                            answer: String,
//                            completion: @escaping (_ result: Result<Void>) -> Void)
//    {
//        requestVoid(target: .answerNotification(id: id, socialNetwork: socialNetwork, notificationType: notificationType, answer: answer),
//                    completion: completion)
//    }
//    
//    func likeNotification(id: Int, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .likeNotification(id: id), completion: completion)
//    }
//    
//    func unlikeNotification(id: Int, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .unlikeNotification(id: id), completion: completion)
//    }
//    
//    func hideNotification(id: Int, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .hideNotification(id: id), completion: completion)
//    }
//    
//    func showNotification(id: Int, completion: @escaping (_ result: Result<Void>) -> Void) {
//        requestVoid(target: .showNotification(id: id), completion: completion)
//    }
//    
//    func getConverseUnreadCount(completion: @escaping (_ result: Result<Int>) -> Void) {
//        request(target: .converseUnreadCount,
//                responseType: Int.self,
//                responseHandler: { json -> Int? in
//                    if let dictionary = json as? JSONDictionary, let message = dictionary["count"] as? Int {
//                        return message
//                    }
//                    return nil
//                },
//                completion: completion)
//    }
//    
//}
//
//let defaultErrorHandler: (Int) -> ErrorResponse? = { statusCode in
//    return nil;
//}
//
//// MARK: - Private methods
//extension RequestManager {
//    fileprivate func isSuccess(statusCode: Int) -> Bool{
//        return statusCode == 200
//    }
//    
//    fileprivate func parseError(_ error: MoyaError) -> ErrorResponse {
//        switch error {
//        case .underlying(let urlError as URLError):
//            if let json = try? error.response?.mapJSON(), let j: Any = json, let errorResponse: ErrorResponse = decode(j) {
//                return errorResponse
//            } else if urlError.code == URLError.Code.notConnectedToInternet {
//                return ErrorResponse(responseMessage: "common_no_internet_connection".localized,
//                                     responseTitle: "common_no_internet_connection_title".localized)
//            } else {
//                return genericError
//            }
//        default:
//            if let json = try? error.response?.mapJSON(), let j: Any = json, let errorResponse: ErrorResponse = decode(j) {
//                return errorResponse
//            } else {
//                return genericError
//            }
//        }
//    }
//    
//    @discardableResult fileprivate func request<T>(target: RequestService,
//                                                responseType: T.Type,
//                                                progressHandler: Moya.ProgressBlock? = nil,
//                                                responseHandler: @escaping ((Any) -> T?),
//                                                errorHandler: @escaping ((Int) -> ErrorResponse?) = defaultErrorHandler,
//                                                completion: @escaping ((Result<T>) -> Void)) -> Cancellable
//    {
//        return provider.request(target, queue: nil, progress: progressHandler) { result in
//            switch result {
//            case let .success(response) :
//                guard let json = try? response.mapJSON() else {
//                    completion(.failure(genericError))
//                    return
//                }
//                if self.isSuccess(statusCode: response.statusCode), let response = responseHandler(json) {
//                    completion(.success(response))
//                } else if let errorResponse: ErrorResponse = errorHandler(response.statusCode) {
//                    completion(.failure(errorResponse))
//                } else if let errorResponse: ErrorResponse = decode(json) {
//                    completion(.failure(errorResponse))
//                } else {
//                    completion(.failure(genericError))
//                }
//            case let .failure(error):
//                completion(.failure(self.parseError(error)))
//            }
//        }
//    }
//    
//    @discardableResult fileprivate func requestDecodable<T: Decodable>(target: RequestService,
//                                                         responseType: T.Type,
//                                                         progressHandler: Moya.ProgressBlock? = nil,
//                                                         errorHandler: @escaping ((Int) -> ErrorResponse?) = defaultErrorHandler,
//                                                         completion: @escaping ((Result<T>) -> Void)) -> Cancellable where T.DecodedType == T
//    {
//        return request(target: target, responseType: responseType, progressHandler: progressHandler, responseHandler: { json -> T? in
//            return T.decode(JSON(json)).value
//        }, errorHandler: errorHandler, completion: completion)
//    }
//    
//    @discardableResult fileprivate func requestVoid(target: RequestService,
//                                                    progressHandler: Moya.ProgressBlock? = nil,
//                                                    errorHandler: @escaping ((Int) -> ErrorResponse?) = defaultErrorHandler,
//                                                    completion: @escaping (Result<Void>) -> Void) -> Cancellable
//    {
//        return provider.request(target, queue: nil, progress: progressHandler) { result in
//            switch result {
//            case let .success(response) :
//                guard let json = try? response.mapJSON() else {
//                    completion(.failure(genericError))
//                    return
//                }
//                if self.isSuccess(statusCode: response.statusCode) {
//                    completion(.success())
//                } else if let errorResponse: ErrorResponse = errorHandler(response.statusCode) {
//                    completion(.failure(errorResponse))
//                } else if let errorResponse: ErrorResponse = decode(json) {
//                    completion(.failure(errorResponse))
//                } else {
//                    completion(.failure(genericError))
//                }
//            case let .failure(error):
//                completion(.failure(self.parseError(error)))
//            }
//        }
//    }
}

class UploadMediaManager: Manager {
    static let shared: UploadMediaManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let manager = UploadMediaManager(configuration: configuration)
        manager.startRequestsImmediately = false
        return manager
    }()
}

class DefaultRequestManager: Manager {
    static let shared: DefaultRequestManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 30 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let manager = DefaultRequestManager(configuration: configuration)
        manager.startRequestsImmediately = false
        return manager
    }()
}
