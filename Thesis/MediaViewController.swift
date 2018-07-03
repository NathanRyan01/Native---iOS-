//
//  MediaViewController.swift
//  Thesis
//
//  Created by Nathan Ryan O Hehir on 07/06/2018.
//  Copyright © 2018 Nathan Ryan O Hehir. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class MediaViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var playVideo: UIButton!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func playStopBtn(_ sender: UIButton) {
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "QueensAudio", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        
        if sender.currentTitle == "Start"{
            self.playSound()
        }
        else{
            self.stopSound()
        }
    }
    
    
    @IBAction func playVideo(_ sender: UIButton) {
        self.startVideo()
        
    }
    
    func playSound(){
        audioPlayer.play()
    }
    
    func stopSound(){
        audioPlayer.stop()
    }
    
    func startVideo(){
        if let path = Bundle.main.path(forResource: "QueensVideo", ofType: "mp4"){
        
        let video = AVPlayer(url: URL (fileURLWithPath:path))
        let videoPlayer = AVPlayerViewController()
        videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion:{
                video.play()
            })
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
