import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                Button(action: { dismiss() }) {
                    Image("Back")
                }.frame(width: 28, height: 28)
                Spacer()
                Text("모임 필터링").wooriFont(font: .AppleSDGothicNeoSemiBold, size: 18)
                Spacer()
                Spacer().frame(width: 28)
            }
            Spacer().frame(height: 40)
            Group {
                Text("모임 카테고리")
                    .wooriFont(font: .NanumMyeongjo, size: 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 20)
                CategoriView()
                //categoryList(action: {})
                Spacer().frame(height: 40)
            }
            Text("평일/주말 선택")
                .wooriFont(font: .NanumMyeongjo, size: 14)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer().frame(height: 20)
            DayView()
            //dayList()
            Spacer()
            WooriButton(text: "완료")
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 26)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func categoryList(action: @escaping () -> Void) -> some View {
      
    }
    
    @ViewBuilder
    func dayList() -> some View {
      
    }
    
    
}

struct CategoriView: View {
    @State var clickedIndex = 0
    private var contentList = [
        "전체", "인간관계(친목)", "술", "자기개발/공부", "예술", "스포츠/운동", "음식", "라이프", "공예/만들기",
        "책/글쓰기/독서", "차/음료", "커리어/직장", "재테크", "반려동물", "게임/액티비티", "여행",
        "환경", "미용", "트렌드", "연애/이성관계", "식물/자연",
    ]
    private var imageList = [
        "AllNot", "Friend", "Alcohol", "Study", "Art", "Sports", "Food", "Life", "Make",
        "Book", "Drink", "Career", "Jaetekeu", "Animal", "Activity", "Travel",
        "Environment", "Beauty", "Trend", "Love", "Nature"
    ]

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                Spacer().frame(height: 5)
                HStack {
                    ForEach(0..<contentList.count) { n in
                        Button {
                            self.clickedIndex = n
                        } label: {
                            VStack {
                                if (n == 0 && clickedIndex == n) {
                                    Image("All").frame(width: 60, height: 60)
                                    Text(contentList[n])
                                        .wooriFont(font: .NanumMyeongjo, size: 8)
                                        .foregroundColor(Color("Gray900"))
                                } else {
                                    if (clickedIndex == n) {
                                        Image(imageList[n])
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .overlay(RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color("MainColor"), lineWidth: 2)
                                            )
                                    } else {
                                        Image(imageList[n]).resizable().frame(width: 60, height: 60)
                                    }
                                  
                                    Text(contentList[n])
                                        .wooriFont(font: .NanumMyeongjo, size: 8)
                                        .foregroundColor(Color("Gray900"))
                                }
                            }
                        }
                    }
                }
                Spacer().frame(height: 5)
            }
        }
    }
}

struct DayView: View {
    @State var clickedIndex = 0

    private var titleList = ["기본", "평일", "주말"]
    private var contentList = [
        "평일과 주말에 모임을 가져보세요.",
        "평일에 모임을 가져보세요.",
        "주말에 모임을 가져보세요.",
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<3) { n in
                    Button {
                        self.clickedIndex = n
                    } label: {
                        dayItem(focused: n == clickedIndex, title: titleList[n], content: contentList[n])
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func dayItem(focused: Bool, title: String, content: String) -> some View {
        if (focused){
            VStack(alignment: .leading) {
                Text(title)
                    .wooriFont(font: .NanumMyeongjo, size: 14)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 0))
                Spacer().frame(height: 6)
                Text(content)
                    .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 0))
              
            }
            .frame(width: 150, height: 100,alignment: .topLeading)
            .background(Color("MainColor"))
            .cornerRadius(8)
            
        } else {
            VStack {
                Text(title)
                    .wooriFont(font: .NanumMyeongjo, size: 14)
                    .foregroundColor(Color("MainColor"))
                    .padding(EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 13))
            }
            .frame(height: 100, alignment: .top)
            .overlay {
                RoundedRectangle(cornerRadius: 8).stroke(Color("MainColor"), lineWidth: 1)
            }
        }
    }
}
