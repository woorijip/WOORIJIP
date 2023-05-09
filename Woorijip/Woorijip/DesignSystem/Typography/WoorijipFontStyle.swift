import SwiftUI

protocol WoorijipFontable {
    var size: CGFloat { get }
    var weight: WoorijipFontWeight { get }
}

public enum WoorijipFontWeight: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
}



