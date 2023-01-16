//
//  UserAPIRouter.swift
//  CeibaTechnicalTest
//
//  Created by Cristian on 14/01/23.
//

import Alamofire
import Foundation

enum UserAPIRouter: URLRequestConvertible {
    case getUsers
    case getUserPostsId(id: Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return APIConstants.userPath
        case .getUserPostsId:
            return APIConstants.postsPath
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case let .getUserPostsId(id):
            return [APIConstants.userIdParams: id]
        default:
            return nil
        }
    }
    
    /// This function is used by Alamofire
    /// - Returns: URL request for Alamofire
    func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        if let parameters = parameters, method == .get {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
