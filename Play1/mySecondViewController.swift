//
//  mySecondViewController.swift
//  Play1
//
//  Created by Dung Tran on 13/11/2018.
//  Copyright © 2018 Dung Tran. All rights reserved.
//

import UIKit

// Global variable
var inputNumber:Int = 0

class mySecondViewController: UIViewController {
    @IBOutlet weak var inputNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func inNum(_ sender: UIButton) {
        // display number on label text
        inputNum.text = String(sender.tag - 1)
        print("inside input " + inputNum.text!)
    }
    
    
    @IBAction func delButton(_ sender: UIButton) {
        inputNum.text = ""
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        inputNumber = Int(inputNum.text!)!   // global variable
    }
    
}
