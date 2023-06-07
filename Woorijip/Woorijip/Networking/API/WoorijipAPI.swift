//
//  WoorijipAPI.swift
//  Woorijip
//
//  Created by 김준호 on 2023/05/31.
//

import Foundation
import Moya


enum WoorijipAPI: TargetType, JwtAuthorizable {
    case signin(req: SignInRequestDTO)
    case signup(req: SignUpRequestDTO)
    case meetings(categories: String, weekType: String, name: String)
}


extension WoorijipAPI {
    public var path: String {
        switch self {
        case .signin:
            return "members/token"
        case .signup:
            return "members"
        case .meetings:
            return "/meetings"
        }
    }

    var baseURL: URL {
        URL(string: "http://192.168.36.57:8080")! // TODO: 나중에 바꾸기
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    public var errorMap: [Int: WoorijipError] {
        switch self {
        default:
            return [
                400: .badRequest,
                401: .notPassword,
                404: .userNotFound,
                500: .serverError
            ]
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .signin, .signup:
            return .post
        case .meetings:
            return .get
        }
    }


    var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Moya.Task {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        switch self {
        case let .signin(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .signup(content):
            return .requestCustomJSONEncodable(content, encoder: encoder)
        case let .meetings(categories, weekType, name):
            return .requestParameters(parameters: [
                "categories": categories,
                "weekType": weekType,
                "name": name
            ], encoding: URLEncoding.queryString)
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        switch self {
        case .meetings:
            return .accessToken
        default:
            return .none
        }
    }
}

