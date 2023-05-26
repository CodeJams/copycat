import SwiftUI

struct Backgroud: View {
    @Binding var index: Int
    @Binding var backgroundColor: UIColor
    @Binding var image: [String]
    
    var body: some View {
        Image(image[index])
          .blur(radius:20.0)
          .aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(.all)
        Color(backgroundColor).ignoresSafeArea()
            .opacity(0.8)
        Rectangle()
            .foregroundColor(Color.black)
            .opacity(0.4)
    }
}
