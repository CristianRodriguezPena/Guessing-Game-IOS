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
    
    var randomNumber = Int(arc4random_uniform(100))
    var userGuess :Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func guessButtonPress(_ sender: Any) {
        userGuess = Int(UserGuessField.text!)
        print(userGuess)
    }
    

}

