//
//  ViewController.swift
//  MagicBall
//
//  Created by Vibhor Gupta on 2/2/19.
//  Copyright © 2019 Vibhor Gupta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player : AVAudioPlayer?
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7",]
    var selectedSoundFileName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func notePressed(_ sender: UIButton) {
        print(sender.tag)
         selectedSoundFileName  = soundArray[sender.tag - 1]
        print(selectedSoundFileName)
        playSound()

    }

    func  playSound(){
        var url =  Bundle.main.url(forResource: selectedSoundFileName , withExtension: "wav")

        do{
            player = try AVAudioPlayer(contentsOf :  url!)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()

        }catch let error as Error {
            print( error )
        }

    }

}

