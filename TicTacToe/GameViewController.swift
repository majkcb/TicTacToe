//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Michael Bergsten on 2022-12-12.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var turnLabel: UILabel!
    
    //Retrieve the content of the TextFields in the Main Screen in these variables
    
    var p1Name : String?
    var p2Name : String?
    
    //This enum is used to determine whose turn it is
    
    enum Turn {
        case X
        case O
    }
    
    // Variables to keep track of whose turn it is to go first in each game
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    // The characters that are placed each turn
    
    var CIRCLE = "O"
    var CROSS = "X"
    
    //Outlets for each button

    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        turnLabel.text = p1Name

    
    }
    
    // This function runs when any of the buttons are pressed
    
    @IBAction func boardTapped(_ sender: UIButton) {
        
        addToBoard(sender)
        
        
    }
    
    // Checks to see if pressed button is empty
    
    func addToBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (currentTurn == Turn.O) {
                sender.setTitle(CIRCLE, for: .normal)
                currentTurn = Turn.X
                turnLabel.text = p1Name
                
            } else if (currentTurn == Turn.X) {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.O
                turnLabel.text = p2Name
                
            }
            
            sender.isEnabled = false
        }
    }
    


}
