import Foundation

struct SignUpRequestDTO: Codable {
    let name, email, phoneNumber: String
    let age: Int
    let password, selfIntroduce: String
    let interestCategories: [String]
}
