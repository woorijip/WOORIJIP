import SwiftUI

protocol WooriFontable {
}

public enum Font: String {
    case AppleSDGothicNeoBold = "AppleSDGothicNeoB"
    case AppleSDGothicNeoSemiBold = "AppleSDGothicNeoSB"
    case AppleSDGothicNeoRegular = "AppleSDGothicNeoR"
    case NanumMyeongjo = "NanumMyeongjo"
    case NanumMyeongjoBold = "NanumMyeongjoBold"
    case NanumMyeongjoExtraBold = "NanumMyeongjoExtraBold"
}
public struct WooriFont: ViewModifier {
    let font: Font
    let size: CGFloat
    
    init(
        font: Font,
        size: CGFloat
    ) {
        self.font = font
        self.size = size
    }

    public func body(content: Content) -> some View {
        return content.font(.custom(font.rawValue, size: size))
    }
}

public extension View {
    func wooriFont(font: Font, size: CGFloat) -> some View {
        self
            .modifier(WooriFont(font: font, size: size))
    }
}

