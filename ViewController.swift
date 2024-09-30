//
//  ViewController.swift
//  Trivia
//
//  Created by Bhattarai, Diya on 2/6/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    

    @IBOutlet var howMany: UILabel!
    @IBOutlet var choose: UILabel!
    @IBOutlet var picker: UIPickerView!
    var myVc = PlayViewController()
    @IBOutlet var number: UILabel!
    var row = 0;
    @IBOutlet var stepper: UIStepper!
    
    var cat = Trivia.getCatergories()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        tabBarController?.viewControllers?[1].tabBarItem.isEnabled = false
        cat.insert(" ", at: 0)
        print(cat.count)
        myVc = tabBarController?.viewControllers?[1] as! PlayViewController
        // Do any additional setup after loading the view.
    }

    @IBAction func stepQ(_ sender: Any) 
    {
        number.text = String(Int(stepper.value))
        if(stepper.value > 0)
        {
            tabBarController?.viewControllers?[1].tabBarItem.isEnabled = true
        }
        else
        {
            tabBarController?.viewControllers?[1].tabBarItem.isEnabled = false
        }
        myVc.number = stepper.value
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cat.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cat[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) 
    {
        //var hi = Trivia.getQuestions(cat[row])
        self.row = row
        
       
        if(row != 0)
        {
            myVc.q = Trivia.getQuestions(cat[row])!
            myVc.cate = cat[row]
        }
        
        
    }
    
    
}

