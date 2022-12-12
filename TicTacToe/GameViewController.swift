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
    
    // Array of buttons (the board)
    
    var board = [UIButton]()
    
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
        
        initializeBoard()
        
        turnLabel.text = p1Name
    
    }
    
    // Function to initialize the buttons to the array (aka the board)
    
    func initializeBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        
        board.append(b1)
        board.append(b2)
        board.append(b3)
        
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
    // Function runs when any of the buttons are pressed
    
    @IBAction func boardTapped(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if (fullBoard()) {
            resultAlert(title: "It's a draw!")
        }
        
    }
    
    // Function that alerts the users (in this case that the board is full, and containins a function to reset the board
    
    func resultAlert(title: String) {
        
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Continue Playing", style: .default, handler: { (_) in self.resetBoard()
            }))
        self.present(ac, animated: true)
    }
    
    // Function that sets all the buttons back to nil
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.O {
            firstTurn = Turn.X
            turnLabel.text = p1Name
        }
        else if firstTurn == Turn.X {
            firstTurn = Turn.O
            turnLabel.text = p2Name
        }
        currentTurn = firstTurn
    }
        
        
        
    
    // Function that checks to see if there's any empty space on the board
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
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
            
            sender.isEnabled = false // Removes the animation if button isn't empty
        }
    }
    


}
