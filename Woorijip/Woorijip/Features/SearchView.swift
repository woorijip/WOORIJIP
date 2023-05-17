import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            HStack {
                FloatingTextField("검색어를 입력해주세요", isSecret: false, text: $searchText)
                Spacer()
                Button(action: {}) {
                    Image("Search")
                }
            
            }
            Spacer()
            Text("조건을 만족하는 모임이 없습니다.")
                .foregroundColor(Color("Gray400"))
                .wooriFont(font: .AppleSDGothicNeoRegular, size: 14)
            Spacer()

        }.padding(.horizontal, 40)
    }
}
