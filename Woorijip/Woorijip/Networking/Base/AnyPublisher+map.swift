import Combine
import Foundation
import Moya

extension AnyPublisher where Output == Moya.Response, Failure == WoorijipError {
    func map<D: Decodable>(
        _ type: D.Type,
        atKeyPath keyPath: String? = nil,
        using decoder: JSONDecoder = JSONDecoder(),
        failsOnEmptyData: Bool = true
    ) -> AnyPublisher<D, WoorijipError> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
}

extension AnyPublisher where Failure == WoorijipError {
    func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, WoorijipError> {
        self.tryMap { element in
            try throwable(element)
        }
        .mapError { $0.asSoopGwanError }
        .eraseToAnyPublisher()
    }
}
