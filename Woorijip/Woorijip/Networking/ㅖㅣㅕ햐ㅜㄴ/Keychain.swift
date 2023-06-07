import Foundation

public enum KeychainType: String {
    case accessToken = "ACCESS-TOKEN"
}

struct TokenDTO: Equatable, Decodable {
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
    }
}
