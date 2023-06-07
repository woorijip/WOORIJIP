import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0
    @State private var isSearchNavigate = false
    @StateObject var viewModel = MainViewModel()
    
    let icons = [
        "Home",
        "Plus",
        "Mypage",
    ]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack() {
                            Spacer().frame(height: 33)
                            HStack {
                                Text("우리동네").wooriFont(font: .AppleSDGothicNeoBold, size: 18)
                                Spacer()
                                Button(action: { isSearchNavigate.toggle() }) {
                                    Image("Search")
                                }
                            }
                            Spacer()
                            Image("Empty")
                            Spacer().frame(height: 40.5)
                            Text("우리 동네에 모임이 없어요.")
                                .wooriFont(font: .NanumMyeongjo, size: 14)
                            Spacer()
                            WooriButton(text: "모임 만들기") {
                                
                            }
                            Spacer().frame(height: 30)
                        }.padding(.horizontal, 40)
                    }
                case 1:
                    NavigationView {
                        
                    }
                default:
                    NavigationView {
                        
                    }
                }
                
                
            }
            .navigationBarHidden(true)
            .navigate(to: SearchView(), when: $isSearchNavigate)
            Spacer()
            Divider()
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
                    if (number != 1) {
                        Button(action: {
                            self.selectedIndex = number
                        }, label: {
                            VStack {
                                Image(icons[number])
                                    .renderingMode(.template)
                                    .foregroundColor(selectedIndex == number ? Color("Gray900") : Color("Gray300"))

                                Text("모임")
                                    .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                                    .foregroundColor(selectedIndex == number ? Color("Gray900") : Color("Gray300"))
                            }
                            
                        })
                        Spacer()
                    } else {
                        Button(action: {
                        }, label: {
                            Image(icons[number]).foregroundColor(Color("Gray900"))
                        })
                        Spacer()
                    }
                   
                }
                .onAppear {
                    viewModel.onAppear()
                }
            }
        }
    
    }
}

