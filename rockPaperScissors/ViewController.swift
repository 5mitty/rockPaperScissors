//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by Jacob Smith on 1/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var topLeftHand: UIImageView!
    @IBOutlet weak var topRightHand: UIImageView!
    var random: Int
    var random2: Int
    @IBOutlet var EnemyPlayerHand: [UIImageView]!
    @IBOutlet weak var yourHand: UIImageView!
    @IBOutlet weak var rockSelection: UIImageView!
    @IBOutlet weak var paperSelection: UIImageView!
    @IBOutlet weak var scissorSelection: UIImageView!
    @IBOutlet var choiceOfHands: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func determineWinner() {
        var win: Bool = false
        for hand in EnemyPlayerHand {
            if hand.image == UIImage(named: "rock") {
                //topLeftHand
            }
        }
    }
    
    


    @IBAction func whenPlayPressed(_ sender: UIButton) {
        random = Int.random(in: 0...2)
        random2 = Int.random(in: 0...2)
        giveEnemyHandChoice()
        
        
    }
    
    @IBAction func whenTappedOnScreen(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: view)
        
        //let selectedPointOnBlankView = sender.location(in: blankView)
        print(tapGesture)
        for hand in choiceOfHands {
            if hand.frame.contains(selectedPoint) {
                var winLeft: Bool = false
                var winRight: Bool = false
                switch hand {
                    case "rock":
                    
                }
                
                if hand.image = "rock"
                
            }
        }
    }
    
    
    
    func giveEnemyHandChoice() {
        
        var hand: UIImage!
        switch random {
        case 0:
            topLeftHand.image = UIImage(named: "rock")
            hand = topLeftHand.image
        case 1:
            topLeftHand.image = UIImage(named: "scissors")
            hand = topLeftHand.image
        case 2:
            topLeftHand.image = UIImage(named: "paper")
            hand = topLeftHand.image
        default:
            return
        }
        
        var hand2: UIImage!
        switch random2 {
        case 0:
            topRightHand.image = UIImage(named: "rock")
            hand2 = topRightHand.image
        case 1:
            topRightHand.image = UIImage(named: "scissors")
            hand2 = topRightHand.image
        case 2:
            topRightHand.image = UIImage(named: "paper")
            hand2 = topRightHand.image
        default:
            return
        }
    }
    
}

