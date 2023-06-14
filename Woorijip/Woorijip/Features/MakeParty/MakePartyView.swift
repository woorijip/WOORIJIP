import SwiftUI
import WebKit

struct MakePartyView: View {
    
    private let urlString: String = ""
    
    var body: some View {
        VStack {
            WebView(url: URL(string: urlString)!)
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
