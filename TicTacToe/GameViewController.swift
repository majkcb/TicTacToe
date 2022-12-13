//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Michael Bergsten on 2022-12-12.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var turnLabel: UILabel!
    
    // Variable for segue to mainscreen
    
    let segueToMain = "segueToMain"
    
    //Retrieve the content of the TextFields in the Main Screen in these variables
    
    var p1Name : String?
    var p2Name : String?
    
    // Variables to keep score
    
    var xScore = 0
    var oScore = 0
    
    //This enum is used to determine whose turn it is
    
    enum Turn {
        case X
        case O
    }
    
    // Variables to keep track of whose turn it is to go first in each game
    
    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    // The symbols that are placed each turn
    
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
    
    // Segue back to mainscreen
    
    @IBAction func exitGameTap(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: segueToMain, sender: self)
        
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
        
        // Checks to see if "X" has won
        
        if checkForVictory(CROSS){
            xScore += 1
        resultAlert(title: "\(p1Name ?? "X") Wins!")
            
        }
        
        // Checks to see if "O" has won
        
        if checkForVictory(CIRCLE){
            oScore += 1
        resultAlert(title: "\(p2Name ?? "O") Wins!")
            
        }
        
        if (fullBoard()) {
            resultAlert(title: "It's a draw!")
        }
        
    }
    
    func checkForVictory(_ s :String) -> Bool {
        
        //Horizontal Victory
        
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        
        //Vertical Victory
        
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        
        //Diagonal Victory
        
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }
        
        return false
    }
    
    // Checks to see if the button contains a symbol (X / O)
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    // Function that alerts the users (in this case that the board is full), and containins a function to reset the board
    
    func resultAlert(title: String) {
        
        // Score update message
        
        let message = "\n\(p1Name ?? "Crosses"): " + String(xScore) + "\n\(p2Name ?? "Circles"): " + String(oScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        // Reset board action

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
