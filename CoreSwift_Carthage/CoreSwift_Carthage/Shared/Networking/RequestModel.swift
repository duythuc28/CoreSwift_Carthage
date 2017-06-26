//
//  RequestServiceModel.swift
//  TimeSheet
//
//  Created by iOS Developer on 4/3/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//
import Argo
import Runes
import Curry


typealias JSONDictionary = [String: Any]

struct Credential {
    let email: String
    let password: String
}

//struct Token {
//    let token: String
//}

//extension Token {
//    init?(json: JSONDictionary) {
//        guard let token = json["token"] as? String else {
//            return nil
//        }
//        self.token = token
//    }
//}


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

//struct HashtagItem: Decodable {
//    let value: String
//    static func decode(_ json: JSON) -> Decoded<HashtagItem> {
//        return curry(HashtagItem.init)
//            <^> json <| "value"
//    }
//    
//}
//
//struct Hashtag: Decodable {
//    let hashtagList: [HashtagItem]
//    let maxHashTag: Int
//    let dynamicHashTag: Bool
//    
//    static func decode(_ json: JSON) -> Decoded<Hashtag> {
//        return curry(Hashtag.init)
//            <^> json <|| "hashtagList"
//            <*> json <| "maxhashtag"
//            <*> json <| "dynamichashtag"
//    }
//}
//
//
//struct PostResponse: Decodable {
//    
//    let facebookMessage: String?
//    let facebookPostId: Int?
//    let facebookSuccess: Bool?
//    let googlePlusSuccess: Bool?
//    
//    static func decode(_ json: JSON) -> Decoded<PostResponse> {
//        return curry(PostResponse.init)
//            <^> json <|? "facebookMessage"
//            <*> json <|? "facebookPostId"
//            <*> json <|? "facebookSuccess"
//            <*> json <|? "googlePlusSuccess"
//    }
//}
//
//struct UploadMedia: Decodable {
//    let name: String
//    let url: String
//    
//    init(name: String, url: String) {
//        self.name = name
//        self.url = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//    }
//    
//    static func decode(_ json: JSON) -> Decoded<UploadMedia> {
//        return curry(UploadMedia.init)
//            <^> json <| "filename"
//            <*> json <| "href"
//    }
//}
//
//struct MediaItemResponse: Decodable {
//    let name: String?
//    let text: String?
//    let mediaType: Media.MediaType
//    let mediaURL: URL
//    
//    static func decode(_ json: JSON) -> Decoded<MediaItemResponse> {
//        let mediaTypeStr: String = ((json <|? "mediaType").value ?? "") ?? ""
//        var mediaType = Media.MediaType.image
//        if mediaTypeStr.lowercased() == "video" {
//            mediaType = .video
//        }
//        let urlStr: String = (json <| "mediaUrl").value ?? ""
//        let url: URL = URL(string: urlStr.urlPathEncoded())!
//        return curry(MediaItemResponse.init)
//            <^> json <|? "name"
//            <*> json <|? "text"
//            <*> pure(mediaType)
//            <*> Decoded<URL>.success(url)
//    }
//    
//    func toMedia(withThumbnail: UIImage? = nil) -> Media {
//        return Media(name: name ?? "",
//                     thumbnailImage: nil,
//                     type: mediaType,
//                     file: nil,
//                     url: mediaURL)
//    }
//}
//
//struct PaginationRequest {
//    let page: Int?
//    let perPage: Int?
//    
//    func nextPageRequest() -> PaginationRequest {
//        return PaginationRequest(page: (page ?? 1) + 1, perPage: perPage)
//    }
//    
//    func toDict() -> [String: Any] {
//        var parameter: [String: Any] = [:]
//        if let page = page {
//            parameter["page"] = page
//        }
//        if let perPage = perPage {
//            parameter["perPage"] = perPage
//        }
//        return parameter
//    }
//}
//
//struct DateFilter {
//    // Timestamp lower bound of time range
//    let since: Int
//    // Timestamp upper bound of time range
//    let until: Int
//    
//    init(since: Date = Date(timeIntervalSince1970: 0), until: Date = Date()) {
//        self.since = Int(since.timeIntervalSince1970)
//        self.until = Int(until.timeIntervalSince1970)
//    }
//    
//    func toDict() -> [String: Any] {
//        return [
//            "since": since,
//            "until": until
//        ]
//    }
//}
//
//struct PaginationResponse: Decodable {
//    let perPage: Int
//    let page: Int
//    let total: Int
//    let hasNextPage: Bool
//    
//    static func decode(_ json: JSON) -> Decoded<PaginationResponse> {
//        return curry(self.init)
//            <^> json <| "perPage"
//            <*> json <| "page"
//            <*> json <| "total"
//            <*> json <| "hasNextPage"
//    }
//}
//
//struct MediaListResponse: Decodable {
//    let mediaList: [MediaItemResponse]
//    let pagination: PaginationResponse
//    
//    static func decode(_ json: JSON) -> Decoded<MediaListResponse> {
//        return curry(MediaListResponse.init)
//            <^> json <|| "mediaList"
//            <*> PaginationResponse.decode(json)
//    }
//}
//
//struct FacebookPost: Decodable {
//    let id: Int
//    let description: String
//    let postAt: Date
//    let createdAt: Date
//    let mediaList: [MediaItemResponse]
//    let likes: Int
//    let comments: Int
//    let insight: Int
//    let shared: Int
//    let love: Int
//    let wow: Int
//    let haha: Int
//    let sorry: Int
//    let anger: Int
//    
//    static func decode(_ json: JSON) -> Decoded<FacebookPost> {
//        let createdTimestamp: TimeInterval = (json <| "createdAt").value ?? 0
//        let createdDate = Date(timeIntervalSince1970: createdTimestamp)
//        
//        let postedTimestamp: TimeInterval = (json <| "postAt").value ?? 0
//        let postedDate = Date(timeIntervalSince1970: postedTimestamp)
//        
//        // Break down to multiple subexpression to improve build time
//        // 1 long expression takes a lot of time to compile
//        let curryInit = curry(self.init)
//        let subExp1 = curryInit
//            <^> json <| "id"
//            <*> json <| "description"
//            <*> Decoded.success(postedDate)
//        let subExp2 = subExp1
//            <*> Decoded.success(createdDate)
//            <*> json <|| "mediaList"
//        let subExp3 = subExp2
//            <*> json <| "likes"
//            <*> json <| "comments"
//        let subExp4 = subExp3
//            <*> json <| "insight"
//            <*> json <| "shared"
//            <*> json <| "love"
//        return subExp4
//            <*> json <| "wow"
//            <*> json <| "haha"
//            <*> json <| "sorry"
//            <*> json <| "anger"
//    }
//}
//
//struct FacebookPostList: Decodable {
//    let postList: [FacebookPost]
//    let pagination: PaginationResponse
//    
//    static func decode(_ json: JSON) -> Decoded<FacebookPostList> {
//        return curry(FacebookPostList.init)
//            <^> json <|| "postList"
//            <*> PaginationResponse.decode(json)
//    }
//}
