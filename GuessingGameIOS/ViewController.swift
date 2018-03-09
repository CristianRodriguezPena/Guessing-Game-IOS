//
//  ViewController.swift
//  GuessingGameIOS
//
//  Created by Cristian Rodriguez on 3/8/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UserGuessField: UITextField!
    @IBOutlet weak var guessesRemaining: UILabel!
    @IBOutlet weak var checking: UILabel!
    @IBOutlet weak var responseToUser: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    var randomNumber = Int(arc4random_uniform(100))
    var userGuess :Int!
    var guessesLeft = 0 {
        didSet {
            guessesRemaining.text = "\(guessesLeft)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guessesLeft = 5
        checking.text = ""
        checking.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 0.61)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guessButton(_ sender: Any) {
        if guessesLeft == 0 {
            randomNumber = Int(arc4random_uniform(100))
            guessesLeft = 5
            checkButton.setTitle("Guess!", for: UIControlState(rawValue: 0))
            responseToUser.text = ""
            return
        }
        userGuess = Int(UserGuessField.text!) ?? -1
        UserGuessField.text = ""
        print(userGuess)
        guessesLeft -= 1
        if userGuess == randomNumber {
            responseToUser.text = "You got it, good job!"
        } else {
            if guessesLeft == 0 {
                responseToUser.text = "You have lost, the number was \(randomNumber), press the 'Restart' button to begin another game"
                checkButton.setTitle("Restart", for: UIControlState(rawValue: 0))
            } else {
                checking.text = "WRONG!!"
                responseToUser.text = "That number was too " + (userGuess < randomNumber ? "Low" : "High")
                checking.text = ""
            }
        }
    }
    
    @IBAction func Testing(_ sender: Any) {
    }
    

}

