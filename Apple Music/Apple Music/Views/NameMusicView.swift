import SwiftUI
import UIKit

struct NameMusicView: View {
    @Binding var index: Int
    var nomeDeMusicas = ["Good 4 u", "Goodbyes", "Black Summer", "Die For You"]
    var nomeDeAlbuns = ["Olivia Rodrigo", "Post Malone", "Red Hot Chili Peppers", "The Weeknd"]
    var body: some View {
        VStack(alignment: .leading){
            Text(nomeDeMusicas[index])
                .font(Font.custom("SFPro", size: 24))
            Text("Red Hot Chili Peppers")
                .font(Font.custom("SFPro", size: 24))
                .opacity(0.6)
        }
        
    }
        
}
