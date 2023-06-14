import SwiftUI

struct MainView: View {
    @State private var selectedIndex = 0
    @State private var isSearchNavigate = false
    @StateObject var viewModel = MainViewModel()
    
    private let items = (1...50).map { "Item \($0)" }
    
    let icons = [
        "Home",
        "Plus",
        "Mypage",
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var itemData: [String] = [""]
    
    
    var body: some View {
        
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        VStack() {
                            Spacer().frame(height: 33)
                            HStack {
                                Text("대전광역시 유성구 장동").wooriFont(font: .AppleSDGothicNeoBold, size: 18)
                                Spacer()
                                Button(action: { isSearchNavigate.toggle() }) {
                                    Image("Search")
                                }
                            }

                            if(itemData.isEmpty) {
                                Spacer()
                                Image("Empty")
                                Spacer().frame(height: 40.5)
                                Text("우리 동네에 모임이 없어요.")
                                    .wooriFont(font: .NanumMyeongjo, size: 14)
                                Spacer()
                                WooriButton(text: "모임 만들기") {

                                }
                                Spacer().frame(height: 30)
                            } else {
                                Spacer().frame(height: 30)
                                ScrollView {
                                    LazyVGrid(
                                        columns: columns,
                                        alignment: .center,
                                        spacing: nil,
                                        pinnedViews: [],
                                        content: {
                                            ForEach(0..<50) { index in
                                                VStack(alignment: .leading) {
                                                    ZStack(alignment: .topLeading) {
                                                        Image("Null").frame(height: 100)
                                                        Text("42회 진행")
                                                            .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                                                            .foregroundColor(.white)
                                                            .padding(.horizontal, 8)
                                                            .padding(.vertical, 2)
                                                            .background(Color("MainColor"))
                                                            .padding(.leading, 4)
                                                            .padding(.top, 8)
                                                    }
                                                    
                                                    Spacer().frame(height: 4)
                                                    
                                                    Text("제목 폼")
                                                        .wooriFont(font: .NanumMyeongjoBold, size: 12)
                                                    Text("오늘의 집 4회 소개! 색감맛집")
                                                        .wooriFont(font: .NanumMyeongjo, size: 10)
                                                    
                                                    Spacer().frame(height: 8)
                                                    
                                                    Text("서울특별시 관악구 봉천동")
                                                        .foregroundColor(Color("Gray400"))
                                                        .wooriFont(font: .NanumMyeongjo, size: 10)
                                                    
                                                    Spacer()
                                                }
                                                .frame(height: 190)
                                            }
                                        }
                                    )
                                }
                                Spacer()
                            }

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

