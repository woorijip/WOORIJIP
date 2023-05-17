import SwiftUI

struct OnboardView: View {
    
    @State private var isLastStack = false
    @State private var isSignInNavigate = false
    
    private let onboardingViews: [(text: String, image: String)] = [
        ("모임을 원하는 사람들에게,", "Onboard1"),
        ("친구가 될 수 있는 사람을 찾아봐요!", "Onboard2"),
        ("호스트가 되어 손님을 초대해보세요.", "Onboard3"),
        ("수익을 창출해보세요.", "Onboard4"),
        ("위치를 통해 더욱 안전한 우리집", "Onboard5")
    ]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "Gray800")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "Gray200")
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                TabView {
                    ForEach(self.onboardingViews.indices, id: \.self) {index in
                        VStack {
                            onboardItem(text: onboardingViews[index].text, image: onboardingViews[index].image)
                            if (index == 4) {
                                Spacer(minLength: 30)
                                WooriButton(text: "로그인") {
                                    isSignInNavigate.toggle()
                                }
                                
                                Spacer(minLength: 30)
                                WooriButton(
                                    text: "회원가입",
                                    color: Color("Gray100"),
                                    textColor: Color("Gray900")
                                ){
                                    
                                }
                                Spacer(minLength: 100)
                            }
                        }.padding(.horizontal, 40)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 380)
                
                if isLastStack {
                    Text("Test")
                }
                
            }
            .navigate(to: SignInView(), when: $isSignInNavigate)
            .navigationTitle("")
        }
        .accentColor(.black)
    }

    @ViewBuilder
    func onboardItem(text: String, image: String) -> some View {
        VStack() {
            Text(text)
                .wooriFont(font: .NanumMyeongjo, size: 18)
                .padding(.top, 1)
                .frame(height: 20)
            
            Image(image)
                .padding(.top, 40)
                .padding(.bottom, 20)
        }
        .frame(height: 200)
    }
    
}
