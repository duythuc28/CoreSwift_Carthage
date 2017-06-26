//
//  RequestManager.swift
//  CoreSwift_Carthage
//
//  Created by iOS Developer on 6/27/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import Moya
import Argo

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

//let uploadProvider = MoyaProvider<RequestService>(endpointClosure: endpointClosure, manager: UploadMediaManager.shared)

//class UploadMediaManager: Manager {
//    static let shared: UploadMediaManager = {
//        let configuration = URLSessionConfiguration.default
//        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 60 // as seconds, you can set your request timeout
//        configuration.timeoutIntervalForResource = 60 // as seconds, you can set your resource timeout
//        configuration.requestCachePolicy = .useProtocolCachePolicy
//        let manager = UploadMediaManager(configuration: configuration)
//        manager.startRequestsImmediately = false
//        return manager
//    }()
//}

final class RequestManager {
    
    private init () {}
    // MARK: - Shared Instance
    static let shared: RequestManager = RequestManager()
    
    // MARK: - Request methods
    func login(credential: Credential, completion: @escaping (_ result: Result<Token>) -> Void) {
        provider.request(.login(credential: credential)) { result in
            switch result {
            case .success(let response):
                guard let json = try? response.mapJSON() else {
                    completion(.failure(RequestError.genericError))
                    return
                }
                if self.isSuccess(statusCode: response.statusCode), let token: Token = decode(json)
                {
                    completion(.success(token))
                } else if let errorResponse: ErrorResponse = decode(json) {
                    completion(.failure(errorResponse))
                } else {
                    completion(.failure(RequestError.genericError))
                }
                break
            case .failure(let error):
                completion(.failure(self.parseError(error)))
                break
            }
        }

    }
    
    func forgotPassword(email: String, completion: @escaping (_ result: Result<String>) -> Void) {
        
    }
    
}

// MARK: - Private methods
extension RequestManager {
    fileprivate func isSuccess(statusCode: Int) -> Bool {
        return statusCode == 200
    }
    
    fileprivate func parseError(_ error: MoyaError) -> ErrorResponse {
        switch error {
        case .underlying(let urlError as URLError):
            if let json = try? error.response?.mapJSON(), let j: Any = json, let errorResponse: ErrorResponse = decode(j) {
                return errorResponse
            } else if urlError.code == URLError.Code.notConnectedToInternet {
                return ErrorResponse(responseMessage: "No Internet connection".localized,
                                     responseTitle: "No Internet connection".localized)
            } else {
                return RequestError.genericError
            }
        default:
            if let json = try? error.response?.mapJSON(), let j: Any = json, let errorResponse: ErrorResponse = decode(j) {
                return errorResponse
            } else {
                return  RequestError.genericError
            }
        }
    }
}


class DefaultRequestManager: Manager {
    static let shared: DefaultRequestManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = RequestConstant.requestTimeOut // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = RequestConstant.requestTimeOut // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        let manager = DefaultRequestManager(configuration: configuration)
        manager.startRequestsImmediately = false
        return manager
    }()
}
