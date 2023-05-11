import SwiftUI

struct MainView: View {
    @State var selectedIndex = 0
    
    let icons = [
        "Home",
        "Plus",
        "Mypage",
    ]
    
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
                    if (number != 1) {
                        Button(action: {
                            self.selectedIndex = number
                        }, label: {
                            VStack {
                                Image(icons[number])
                                    .renderingMode(.template)
                                    .foregroundColor(selectedIndex == number ? Color("Gray900") : Color("Gray300"))

                                Text("모임")
                                    .wooriFont(font: .AppleSDGothicNeoRegular, size: 10)
                                    .foregroundColor(selectedIndex == number ? Color("Gray900") : Color("Gray300"))
                            }
                            
                        })
                        Spacer()
                    } else {
                        Button(action: {
                        }, label: {
                            Image(icons[number]).foregroundColor(Color("Gray900"))
                        })
                        Spacer()
                    }
                   
                }
            }
        }
    
    }
}

