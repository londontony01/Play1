//
//  mySecondViewController.swift
//  Play1
//
//  Created by Dung Tran on 13/11/2018.
//  Copyright © 2018 Dung Tran. All rights reserved.
//

import UIKit

// Global variable
//var inputNumber:Int = 0

class mySecondViewController: UIViewController {
    @IBOutlet weak var inputNum: UILabel!
    var myInputNum:Int = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func inNum(_ sender: UIButton) {
        // display number on label text
        inputNum.text = String(sender.tag - 1)
        myInputNum = sender.tag - 1
    }
    
    
    @IBAction func delButton(_ sender: UIButton) {
        inputNum.text = ""
    }
    
    // prepare segque
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
       if myInputNum != 99{
            inputNumber = myInputNum    //pass to global variable
       }
        else if myInputNum == 99{
            print (" Error in second controller, no input!")
        }
    }


    @IBAction func confirmButton(_ sender: UIButton) {
        performSegue(withIdentifier: "myBackOption", sender: self)
        //dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        myInputNum = 66
        inputNumber = 66
        performSegue(withIdentifier: "myBackOption", sender: self)
    }
    
}
