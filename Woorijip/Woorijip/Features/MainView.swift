import SwiftUI

struct MainView: View {
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        
                    }
                case 1:
                    NavigationView {
                        
                    }
                default:
                    NavigationView {
                        
                    }
                }
                
                
            }
            Spacer()
            Divider()
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("Home").foregroundColor(Color("Gray900"))
                            Text("모임")
                                .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                                .foregroundColor(Color("Gray900"))
                        }
                        
                    })
                    Spacer()
                }
            }
        }
    
    }
}

