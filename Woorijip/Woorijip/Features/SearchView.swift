import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}) {
                    Image("Back")
                }
                FloatingTextField("검색어를 입력해주세요", isSecret: false, size: 12, height: 32, text: $searchText)
                Spacer()
                Button(action: {}) {
                    Image("Search")
                }
            }
            Spacer().frame(height: 12)
            Button(action:{}) {
                Image("Filter")
                Text("모임 필터링")
                    .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                    .foregroundColor(Color("Gray300"))
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Text("조건을 만족하는 모임이 없습니다.")
                .foregroundColor(Color("Gray400"))
                .wooriFont(font: .AppleSDGothicNeoRegular, size: 14)
            Spacer()

        }
        .navigationBarHidden(true)
        .padding(.horizontal, 40)
    }
}
