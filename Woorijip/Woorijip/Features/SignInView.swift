import Foundation
import SwiftUI

struct SignInView: View {
    @State private var idText: String = ""
    @State private var passwordText: String = ""
    @State private var isSignInNavigate = false

    
    var body: some View {
        VStack {
            Image("SignTopImg").frame(maxWidth: .infinity, alignment: .trailing)
            VStack(alignment: .leading) {
                Text("로그인")
                    .wooriFont(font: .AppleSDGothicNeoSemiBold, size: 20)
                    .frame(alignment: .leading)
                
                Spacer().frame(height: 4)
                
                Text("우리집을 통해서 친구를 찾아보세요.")
                    .wooriFont(font: .AppleSDGothicNeoSemiBold, size: 14)
                    .foregroundColor(Color("Gray500"))
                
                Spacer().frame(height: 40)
                
                FloatingTextField("이메일을 입력해 주세요.", isSecret: false, text: $idText)
                
                Spacer().frame(height: 12)

                FloatingTextField("비밀번호를 입력해 주세요.", isSecret: true, text: $passwordText)
                
                Spacer().frame(height: 40)

                WooriButton(text: "로그인"){
                    isSignInNavigate.toggle()
                }
                
            }
            .navigate(to: MainView(), when: $isSignInNavigate)
            .navigationTitle("")
            .padding(.horizontal, 40)
        }
        
        Spacer()
        
        HStack {
            Text("아직 회원이 아니신가요?")
                .wooriFont(font: .AppleSDGothicNeoSemiBold, size: 12)
                .foregroundColor(Color("Gray900"))
            Text("회원가입")
                .wooriFont(font: .AppleSDGothicNeoRegular, size: 12)
                .foregroundColor(Color("Gray600"))
        }
        Image("SignBottomImg").frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
