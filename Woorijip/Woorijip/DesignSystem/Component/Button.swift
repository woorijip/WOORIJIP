import SwiftUI

public struct WooriButton: View {
    var text: String
    var style: WooriButtonStyle.Style
    var color: Color
    var textColor: Color
    var action: () -> Void

    public init(
        text: String = "",
        style: WooriButtonStyle.Style = .contained,
        color: Color = Color("Gray900"),
        textColor: Color = Color("Gray100"),
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.color = color
        self.textColor = textColor
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()

                Text(text)
                    .foregroundColor(textColor)
                    .wooriFont(font: .NanumMyeongjoBold, size: 14)
                    .padding(.vertical, 14)


                Spacer()
            }
        }
        .buttonStyle(WooriButtonStyle(style: style, color: color))
    }
}
public struct WooriButtonStyle: ButtonStyle {
    public enum Style {
        case contained
    }

    var style: Style
    var color: Color

    public func makeBody(configuration: Configuration) -> some View {
        return AnyView(ContainedButton(configuration: configuration, color: color))
    }
}

// MARK: - Usage
extension Button {
    func dmsStyle(_ style: WooriButtonStyle.Style, color: Color) -> some View {
        self.buttonStyle(WooriButtonStyle(style: style, color: color))
    }
}

// MARK: - Contained
extension WooriButtonStyle {
    struct ContainedButton: View {
        let configuration: ButtonStyle.Configuration
        let color: Color
        var opacity: Double {
            isEnabled ?
                configuration.isPressed ? 0.7 :
                    1.0 :
                    0.5
        }
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .font(.system(size: 15, weight: .medium))
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(5)
                .opacity(opacity)
        }
    }
}
