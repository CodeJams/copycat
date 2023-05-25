import SwiftUI
import UIKit

let musicController = MusicController()
struct ContentView: View {
    @State var isPaused = true
    @State private var backgroundColor: UIColor = .clear
    var image = ["imagem1", "imagem2", "imagem3"]
    @State var index = 0

    var body: some View {
        ZStack {
            //background
            ZStack{
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
            VStack {                
                HStack(spacing: 76){
                    Button (action: {
                        if index != 0{
                            index -= 1;
                            setAverageColor()
                        }
                        musicController.playMusic(index: index)
                        
                    }){
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 53, height: 40, alignment: .center)
                    }
                    if(isPaused == true){
                        Button (action: {musicController.playMusic(index: index); isPaused = false}){
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
                    Button (action: {
                        if index == 2{
                            index = 0
                        }else{
                            index += 1;
                        }
                        setAverageColor()
                        musicController.playMusic(index: index)
                        
                    }){
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
        @State var uiColor = UIImage(named: image[index])?.averageColor
        print(image[index])
        backgroundColor = uiColor ?? .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

