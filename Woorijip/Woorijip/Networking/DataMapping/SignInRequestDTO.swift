//
//  SignInRequestDTO.swift
//  Woorijip
//
//  Created by 김준호 on 2023/05/31.
//

import Foundation

// MARK: - Welcome
struct SignInRequestDTO: Codable {
    let email, password: String
}
