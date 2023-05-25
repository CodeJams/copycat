import UIKit
import AVFoundation

class MusicController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    var listaDeMusicas = ["musica1", "musica2", "musica3"]
    
    @objc func playMusic(index: Int) {
        guard let url = Bundle.main.url(forResource: listaDeMusicas[index], withExtension: "mp3") else {
            print("Erro ao carregar o arquivo de música")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print(listaDeMusicas[index])
        } catch {
            print("Erro ao reproduzir a música: \(error.localizedDescription)")
        }
    }

    @objc func pauseMusic() {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
        }
    }

}
