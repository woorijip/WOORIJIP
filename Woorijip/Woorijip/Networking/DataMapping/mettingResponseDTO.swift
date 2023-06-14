//
//  mettingResponseDTO.swift
//  Woorijip
//
//  Created by 김준호 on 2023/06/02.
//

import Foundation

import Foundation

struct mettingResponseDTO: Codable {
    let id: Int
    let name, introduction, thumbnail, location: String
    let type: String
    let images: [String]
    let description: String
    let schedules: [Schedule]
    let categories: [String]
    let meetingCount, createMemberId: Int
    let createdAt, updatedAt: String


}

// MARK: - Schedule
struct Schedule: Codable {
    let date, time: String
    let maxMember: Int
}
