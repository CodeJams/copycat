import SwiftUI

struct Backgroud: View {
    @Binding var index: Int
    @Binding var backgroundColor: UIColor
    @Binding var image: [String]
    
    var body: some View {
        Image(image[index])
            .resizable()
            .blur(radius:40.0)
            .edgesIgnoringSafeArea(.all)
        Color(backgroundColor)
            .ignoresSafeArea()
            .opacity(0.8)
        Rectangle()
            .foregroundColor(Color.black)
            .opacity(0.3)
            .edgesIgnoringSafeArea(.all)

    }
}
