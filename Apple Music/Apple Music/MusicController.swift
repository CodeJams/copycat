import UIKit
import AVFoundation

class MusicController: UIViewController, ObservableObject {

    private var audioPlayer: AVAudioPlayer?
	
	// Metadados para controlar o tempo
	@Published var currentTime: TimeInterval = 0
	
	var duration: TimeInterval {
		audioPlayer?.duration ?? 0
	}
	
	var isPlaying: Bool {
		audioPlayer?.isPlaying ?? false
	}
    
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

//extension MusicPlayer: AVAudioPlayerDelegate {
//	func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//		// Handle playback finished event if needed
//	}
//}
