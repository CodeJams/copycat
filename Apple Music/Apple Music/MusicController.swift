import UIKit
import AVFoundation

class MusicController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    @objc func playMusic() {
        guard let url = Bundle.main.url(forResource: "musica", withExtension: "mp3") else {
            print("Erro ao carregar o arquivo de música")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
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
