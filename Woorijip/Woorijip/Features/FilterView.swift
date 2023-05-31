import SwiftUI

struct FilterView: View {
    @Environment(\.dismiss) private var dismiss
    private var contentList = ["전체", "인간관계(친목)", "술", "자기개발/공부", "예술", "운동"]
    private var imageList = ["All", "Base", "Base", "Base", "Base", "Base"]

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
                categoryList(action: {})
                Spacer().frame(height: 40)
            }
            Text("평일/주말 선택")
                .wooriFont(font: .NanumMyeongjo, size: 14)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer().frame(height: 20)
            dayList()
            Spacer()
            WooriButton(text: "완료")
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 26)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    func categoryList(action: @escaping () -> Void) -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<6) { n in
                    VStack {
                        Image(imageList[n]).frame(width: 60, height: 60)
                        Text(contentList[n]).wooriFont(font: .NanumMyeongjo, size: 8)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func dayList() -> some View {
        HStack {
            dayItem(focused: true, title: "기본", content: "평일과 주말에 모임을 가져보세요.")
            dayItem(focused: false, title: "평일", content: "평일에 모임을 가져보세요.")
            dayItem(focused: false, title: "주말", content: "주말에 모임을 가져보세요.")
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
