import Combine

open class BaseViewModel: ObservableObject {
    @Published public var isErrorOcuured = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    public var bag = Set<AnyCancellable>()

    public init() {}

    public func addCancellable<T>(
        _ publisher: AnyPublisher<T, WoorijipError>,
        onReceiveValue: @escaping (T) -> Void,
        onReceiveError: ((WoorijipError) -> Void)? = nil
    ) {
        print("addCancellable")
        isLoading = true
        publisher
            .sink(receiveCompletion: { [weak self] completion in
                print(completion)
                if case let .failure(error) = completion {
                    if let onReceiveError {
                        onReceiveError(error.asSoopGwanError)
                    }
                    self?.errorMessage = error.localizedDescription
                    self?.isErrorOcuured = true
                }
                self?.isLoading = false
            }, receiveValue: onReceiveValue)
            .store(in: &bag)
    }
}
