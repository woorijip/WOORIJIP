//
//  TextField.swift
//  Woorijip
//
//  Created by 김준호 on 2023/05/03.
//

import SwiftUI

public struct FloatingTextField: View {
    let placeholder: String
    let isSecret: Bool
    @Binding var text: String
    @State private var isShow: Bool
    
    init(
        _ placeholder: String,
        isSecret: Bool,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.isSecret = isSecret
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
            .font(.system(size: 16, weight: .regular))
            .frame(height: 45)
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

