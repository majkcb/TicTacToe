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
    
    let segueToPlay = "segueToPlayView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
    }
    
    @IBAction func playVsAI(_ sender: UIButton) {
    }
    
    
    
}
