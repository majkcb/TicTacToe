//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Michael Bergsten on 2022-12-12.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var turnLabel: UILabel!
    
    var p1Name : String?
    var p2Name : String?
    
    enum Turn {
        case X
        case O
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        turnLabel.text = p1Name
        
        

    
    }
    



}
