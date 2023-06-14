import Combine
import CombineMoya
import Foundation
import Moya

public class BaseRemoteDataSource {
    private let keychain = KeychainImpl()
    var provider = MoyaProvider<WoorijipAPI>(plugins: [JwtPlugin(), NetworkLoggerPlugin()])
//    var provider = MoyaProvider<WoorijipAPI>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    func request<T: Decodable>(_ api: WoorijipAPI, dto: T.Type) -> AnyPublisher<T, WoorijipError> {
        requestPublisher(api).map(dto, using: decoder)
    }

    func request(_ api: WoorijipAPI) -> AnyPublisher<Void, WoorijipError> {
        requestPublisher(api)
            .map { _ in return }
            .eraseToAnyPublisher()
    }

    private func requestPublisher(_ api: WoorijipAPI) -> AnyPublisher<Response, WoorijipError> {
        return checkIsApiNeedsAuthorization(api) ?
            authorizedRequest(api) :
            defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: WoorijipAPI) -> AnyPublisher<Response, WoorijipError> {
//        provider.request(api) { response in
//            switch response {
//            case .success(let result) :
//                do {
//                    let members = try self.decoder.decode([mettingResponseDTO].self, from: result.data)
//                    print("❐")
//                    print("\(members)")
//                } catch {
//                    print("⁉️")
//                    print(error.localizedDescription)
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
        
        return provider.requestPublisher(api)
            .retry(maxRetryCount)
            .timeout(45, scheduler: DispatchQueue.main)
            .mapError {
                api.errorMap[$0.response?.statusCode ?? 0] ?? .unknown
            }
            .eraseToAnyPublisher()
    }

    func authorizedRequest(_ api: WoorijipAPI) -> AnyPublisher<Response, WoorijipError> {
        return defaultRequest(api)
    }

    func checkIsApiNeedsAuthorization(_ api: WoorijipAPI) -> Bool {
        api.jwtTokenType == .accessToken
    }
}
