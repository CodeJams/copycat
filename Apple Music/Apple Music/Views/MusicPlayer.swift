import SwiftUI
import UIKit

struct MusicPlayer: View {
    
    @State var image = ["imagem1", "imagem2", "imagem3", "imagem4"]
    @State private var backgroundColor: UIColor = .clear
    @State var isPaused = true
    @State var index = 0
	@StateObject var musicController = MusicController()
    @State var musicCoverSize = 252

    var body: some View {
        ZStack {
            //background
            Backgroud(index: $index, backgroundColor: $backgroundColor, image: $image)
            
            VStack {

                MusicCoverView(index: $index, image: $image, musicCoverSize: $musicCoverSize)
                
                //Botões para tocar e passar a musica
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
                            .foregroundColor(Color.white)

                    }
                    if(isPaused == true){
                        Button (action: {musicController.playMusic(index: index); isPaused = false;                             musicCoverSize = 362
}){
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 35, height: 45, alignment: .center)
                                .foregroundColor(Color.white)
                            

                        }
                    }else{
                        Button (action: {musicController.pauseMusic(); isPaused = true;                             musicCoverSize = 252}){
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 35, height: 45, alignment: .center)
                                .foregroundColor(Color.white)

                        }
                    }
                    Button (action: {
                        if index == 3{
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
                            .foregroundColor(Color.white)

                    }
                }
                
//                AppleMusicProgressBar(currentTime: $musicController.currentTime, duration: musicController.duration)
//
            }.padding()
            
        }.padding()
        .edgesIgnoringSafeArea(.all)
        .onAppear {self.setAverageColor()}

    } 
    
    //Devolve a cor média
    func setAverageColor() {
        @State var uiColor = UIImage(named: image[index])?.averageColor
        print(image[index])
        backgroundColor = uiColor ?? .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}

