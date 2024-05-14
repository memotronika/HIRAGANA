//
//  score.swift
//  HIRAGANA
//
//  Created by Anton Angel on 13/05/2024.
//

import Foundation
import UIKit

class Score {
    var score = 0
    var mistakes = 0
    var minutes = 0
    var seconds = 1
    var maxMistakes : Int
    var interface : Interface!
    var monograph : Monograph!
    
    init(interface:Interface,monograph:Monograph) {
        self.interface = interface
        self.monograph = monograph
        self.maxMistakes = monograph.monographsList.count / 9
        
    }
    
    func updateTimer(_ sec:Int) {
        if seconds > 9 {
            interface.timerLabel.text = "\(minutes):\(seconds)"
        } else {
            interface.timerLabel.text = "\(minutes):0\(seconds)"
        }
        seconds += sec
        if seconds == 60 {
            seconds -= 60
            minutes += 1
        }
    }
    
    func updateScore() {
        interface.scoreLabel.text = String(score)
    }
    
    func updateProgress() {
        interface.progressBar.progress = Float(score)/Float(monograph.monographsList.count)
    }
    
    func doDefaults() {
        seconds = 1
        minutes = 0
        mistakes = 0
        score = 0
    }
        
}
