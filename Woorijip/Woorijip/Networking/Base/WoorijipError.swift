import Foundation

public enum WoorijipError: Error {
    // MARK: users
    case unknown
    case badRequest
    case notPassword

    case unauthorized
    case userNotFound
    case notFound
    case conflict
    case toManyRequests
    case serverError
}

extension WoorijipError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 오류가 발생하였습니다."
        case .badRequest:
            return "요청이 잘못되었습니다."
        case .serverError:
            return "서버에서 문제가 발생하였습니다. 잠시 후 다시 시도해주세요!"
        case .unauthorized:
            return "토큰이 유효하지 않습니다."
        case .notFound:
            return "정보를 찾을 수 없습니다."
        case .conflict:
            return "conflict가 발생했습니다."
        case .toManyRequests:
            return "잠시 후 다시 시도하세요"
        case .userNotFound:
            return "계정을 찾을 수 없습니다."
        case .notPassword:
            return "비밀번호가 일치하지 않습니다."
        }
    }
}

public extension Error {
    var asSoopGwanError: WoorijipError {
        self as? WoorijipError ?? .unknown
    }
}
