//
//  PlaySound.swift
//  Love&Care
//
//  Created by Youssef Eldeeb on 25/10/2022.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(soundFile: String, soundType: String){
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print(error.localizedDescription)
        }
    }
        
}
