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
        print("inside 2nd controller, inputNum.text= " + inputNum.text!)
        print("inside 2nd controller, myInputNum= \(myInputNum)")
    }
    
    
    @IBAction func delButton(_ sender: UIButton) {
        inputNum.text = ""
    }
    
    // prepare segque
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        print("inside prepare myInputNum = \(myInputNum)")
        let myFirst: ViewController = seque.destination as! ViewController
        //let storyboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        //let myFirst: ViewController = storyboard.instantiateViewController(withIdentifier: myIdentifier) as! ViewController

        if myInputNum != 99{
            myFirst.numberOfDraws += 1
            print(" inside prepare draw  \(myFirst.numberOfDraws)")
            print("draw number = \(myInputNum)")
            myFirst.drawNumbersArray.insert(Int(myInputNum), at: 0)
            print("drawNumbersArray = \(myFirst.drawNumbersArray)")
            //myFirst.tableList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        }
        else{
            print (" Error in second controller, no input!")
        }
        
    }


    @IBAction func confirmButton(_ sender: UIButton) {
        //inputNumber = Int(inputNum.text!)!   // global variable
        // using Seque to get back to the 1st view controller
        //performSegue(withIdentifier: myBackOption, sender: self)
        print("inside confirm, perform myBackOption")
        performSegue(withIdentifier: "myBackOption", sender: self)
        //dismiss(animated: true, completion: nil)
    }
    
}
