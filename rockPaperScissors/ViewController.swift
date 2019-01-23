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
    var random: Int = 0
    var random2: Int = 0
    @IBOutlet var EnemyPlayerHand: [UIImageView]!
    @IBOutlet weak var yourHand: UIImageView!
    @IBOutlet weak var rockSelection: UIImageView!
    @IBOutlet weak var paperSelection: UIImageView!
    @IBOutlet weak var scissorSelection: UIImageView!
    @IBOutlet var choiceOfHands: [UIImageView]!
    @IBOutlet weak var victoryLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    var timerIsOn: Bool = false
    var timer = Timer()
    var globalWin: Bool = false
    var count: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func determineWinner() {
        var win: Bool = false
        var tie: Bool = false
        for hand in EnemyPlayerHand {
            if hand.image == UIImage(named: "rock") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = false
                }
            }
            if hand.image == UIImage(named: "paper") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = true
                }
            }
            if hand.image == UIImage(named: "paper") {
                if yourHand.image == UIImage(named: "rock") {
                    win = false
                }
                if yourHand.image == UIImage(named: "paper") {
                    win = false
                    tie = true
                }
                if yourHand.image == UIImage(named: "scissors") {
                    win = true
                }
            }
        }
        if win == true {
            victoryLabel.text = "You Win"
        }
        if tie == true {
            victoryLabel.text = "You Tie"
        } else {
            victoryLabel.text = "You Lose"
        }
    }

    @IBAction func whenPlayPressed(_ sender: UIButton) {
        random = Int.random(in: 0...2)
        random2 = Int.random(in: 0...2)
        giveEnemyHandChoice()
        determineWinner()
        
    }
    
    @IBAction func whenTappedOnScreen(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: view)

        //let selectedPointOnBlankView = sender.location(in: blankView)
        print(tapGesture)
        for hand in choiceOfHands {
            if hand.frame.contains(selectedPoint) {
                yourHand.image = hand.image

            }
        }
    }
    
    @IBAction func whenStartButtonPressed(_ sender: Any) {
        timerIsOn = true
        count = 3
        timerLabel.text = "\(count)"
        if timerIsOn {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                if self.count > 0 {
                    self.count -= 1
                }
                self.timerLabel.text = "\(self.count)"
                if self.count == 0 {
                    self.victoryLabel.text = "You Lose"
                    self.timerIsOn = false
                }
            })
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

