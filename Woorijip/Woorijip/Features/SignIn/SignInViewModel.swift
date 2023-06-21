import Combine
import Foundation

final class SignInViewModel: BaseViewModel {
//    @Published var email = "kimjjun1007@gmail.com"
//    @Published var password = "qwer1234!"
    
    @Published var email = ""
    @Published var password = ""
    

    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    @Published var buttonPressed = false

    var isSigninEnabled: Bool {
        !email.isEmpty && !password.isEmpty
    }

    private let membersDataSource = MainDataSource()

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        addCancellable(
            membersDataSource.signin(
                req: SignInRequestDTO(email: email, password: password)
            )
        ) { [weak self] _ in
            print("dkfjsdlkfjdklfjkl")
            self?.isSuccessSignin = true
        }
    }

}
