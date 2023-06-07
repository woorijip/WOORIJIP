//
//  MembersDataSource.swift
//  Woorijip
//
//  Created by 김준호 on 2023/05/31.
//

import Foundation
import Combine

final class MainDataSource: BaseRemoteDataSource {
    func signin(req: SignInRequestDTO) -> AnyPublisher<Void, WoorijipError> {
        request(.signin(req: req))
            .eraseToAnyPublisher()
    }

    func signUp(req: SignUpRequestDTO) -> AnyPublisher<Void, WoorijipError> {
        request(.signup(req: req))
            .eraseToAnyPublisher()
    }
    
    func meetings(categories: String, weekType: String, name: String) -> AnyPublisher<[mettingResponseDTO], WoorijipError> {
        request(.meetings(categories: categories, weekType: weekType, name: name), dto: [mettingResponseDTO].self)
            .eraseToAnyPublisher()
    }

}
