//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player: AVAudioPlayer!
    let twinkleArray1 = [1,1,5,5,6,6,5]
    let twinkleArray2 = [4,4,3,3,2,2,1]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for note in twinkleArray1 {
            play(tag: note)
            usleep(500000)
        }
        
        sleep(1)
        
        for note in twinkleArray2 {
            play(tag: note)
            usleep(500000)
        }
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        play(tag: sender.tag)
        
    }
    
    func play(tag: Int) {
        guard let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav") else { return }
        
        do {
            try player = AVAudioPlayer(contentsOf: url)
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    
    }

}

