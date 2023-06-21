import SwiftUI

public struct FloatingTextField: View {
    let placeholder: String
    let isSecret: Bool
    let size: CGFloat
    let height: CGFloat
    @Binding var text: String
    @State private var isShow: Bool
    
    init(
        _ placeholder: String,
        isSecret: Bool,
        size: CGFloat = 14,
        height: CGFloat = 40,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.isSecret = isSecret
        self.size = size
        self.height = height
        self._text = text
        self.isShow = !isSecret
    }
    
    public var body: some View {
        ZStack(alignment: .trailing) {
            HStack {
                if isShow {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }
            .font(.system(size: size, weight: .regular))
            .frame(height: height)
            .padding(.leading, 19)
            .textInputAutocapitalization(.never)
            .overlay {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.gray, lineWidth: 1)
            }
            if isSecret {
                HStack {
                    Button {
                        self.isShow.toggle()
                    } label: {
                        Image(systemName: isShow ? "eye" : "eye.slash")
                    }
                    .frame(width: 25, height: 23)
                    .tint(.gray)
                    .padding(.trailing, 15)
                }
            }
        }
    }
}

