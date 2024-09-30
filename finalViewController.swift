//
//  finalViewController.swift
//  Trivia
//
//  Created by Bhattarai, Diya on 2/22/24.
//

import UIKit

class finalViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    var score = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)";
        // Do any additional setup after loading the view.
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
