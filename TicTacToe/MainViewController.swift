//
//  MainViewController.swift
//  TicTacToe
//
//  Created by Michael Bergsten on 2022-12-12.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var p1TextField: UITextField!
    @IBOutlet weak var p2TextField: UITextField!
    
    
    var gameMode = 0
    
    let segueToPlay = "segueToPlayView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if p1TextField.text == nil {
            p1TextField.text = "Player 1"
        }
        
        if p2TextField.text == nil {
            p2TextField.text = "Player 2"
        }
        
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        performSegue(withIdentifier: segueToPlay, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToPlay {
            if let destinationVCOne = segue.destination as? GameViewController {
                destinationVCOne.p1Name = p1TextField.text
            }
            if let destinationVCTwo = segue.destination as? GameViewController {
                destinationVCTwo.p2Name = p2TextField.text
            }
            
            if let destinationVCPC = segue.destination as? GameViewController {
                destinationVCPC.pcGameMode = gameMode
            }
        }
        
    }
    
    @IBAction func playVsAI(_ sender: UIButton) {
        
        performSegue(withIdentifier: segueToPlay, sender: self)
        
    }
    
    
}
