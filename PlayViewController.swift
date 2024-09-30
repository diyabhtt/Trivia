//
//  PlayViewController.swift
//  Trivia
//
//  Created by Bhattarai, Diya on 2/14/24.
//

import UIKit

class PlayViewController: UIViewController {
    
    var q: [Trivia] = []
    var number = 0.0;
    var amount = 0.0;
    var row = 0;
    @IBOutlet var buttons: [UIButton]!
    var num = 0
    @IBOutlet var questionLabel: UILabel!
    var cate: String = ""
    @IBOutlet var label: UILabel!
    var but = 0;
    @IBOutlet var playTab: UITabBarItem!
   var points = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //playTab.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated : Bool)
    {
        game()
        //print(q[row])
    }
    
    func game()
    {
        amount += 1;
        //let myVc = tabBarController?.viewControllers?[0] as! ViewController
        //print(q)
        num = Int.random(in: 0..<q.count)
       // print(q[num])
        label.text = cate
        questionLabel.text = q[num].questions
        var a = q[num].correctA
        var answers = q[num].incorrectA
        but = Int.random(in: 0..<4)
        answers.insert(q[num].correctA, at: but)
        print(a)
        //print(but)
        for i in 0..<answers.count
        {
            var ind = 0
            if(answers.count != 0)
            {
                ind =  Int.random(in: 0..<answers.count)
                    if(ind == but )
                    {
                        buttons[but].setTitle(answers[ind], for: .normal)
                        
                        answers.remove(at: but)
                        //but = i
                    }
                else
                {
                    buttons[i].setTitle(answers[ind], for: .normal)
                    answers.remove(at: ind)
                }
                //print(inc)
                   
            }

        }
        //buttons[but].setTitle(String(a), for: .normal)
        
    }

    @IBAction func click(_ sender: UIButton)
    {
        //print("hi")
        //print(buttons[but].titleLabel)
        
        if sender.title(for: .normal) == buttons[but].title(for: .normal)
        {
            
            buttons[but].backgroundColor = UIColor.green
            print("correct")
            points += 1
            
            
        }
        else
        {
            buttons[but].backgroundColor = UIColor.red
            //(sender as AnyObject).removeFromSuperview()
            print("incorrect")
        }
        if(amount != number)
        {
            game()
        }
        else
        {
            score()
        }
    
    }
    func score()
    {
        performSegue(withIdentifier: "score", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let myVc = segue.destination as? finalViewController
        print(points)
        myVc?.score = points
        segue.destination.navigationItem.title = "Score \(points)"
            
            
    }
                
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
