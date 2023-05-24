import SwiftUI
import UIKit


let musicController = MusicController()


struct ContentView: View {
    @State var isPaused = true
    @State private var backgroundColor: UIColor = .clear
    private let image = "backgroundImage"

    var body: some View {
        ZStack {
            Color(backgroundColor).ignoresSafeArea()
            VStack {
            HStack(spacing: 76){
                Button (action: {musicController.playMusic()}){
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 53, height: 40, alignment: .center)
                }
                if(isPaused == true){
                    Button (action: {musicController.playMusic(); isPaused = false}){
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 35, height: 45, alignment: .center)
                    }
                }else{
                    Button (action: {musicController.pauseMusic(); isPaused = true}){
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                    }
                }
                Button (action: {musicController.playMusic()}){
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 53, height: 40, alignment: .center)
                }
            }
            
        }.padding()

        }.edgesIgnoringSafeArea(.all)
            .onAppear {self.setAverageColor()}
        
    } 
    
    //Devolve a cor média
    private func setAverageColor() {
        let uiColor = UIImage(named: image)?.averageColor
        backgroundColor = uiColor ?? .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

