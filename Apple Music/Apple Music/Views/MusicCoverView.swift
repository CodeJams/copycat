import Foundation
import SwiftUI

struct MusicCoverView: View {
    @Binding var index: Int
    @Binding var image: [String]
    
    var body: some View {
//            GeometryReader { geometry in
                Image(image[index])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(7.19)
                    .shadow(radius: 10)
                    .padding(.bottom, 150)
                    .padding(.horizontal, 64)
//     }

    }
}
