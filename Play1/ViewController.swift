//
//  ViewController.swift
//  Play1
//
//  Created by Dung Tran on 10/11/2018.
//  Copyright © 2018 Dung Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var inputNum: UITextField!
    
    
    // Some data
    let drawNumbers = ["Num0", "Num1", "Num2", "Num3", "Num4", "Num5", "Num6", "Num7", "Num8", "Num9", "Num10", "Num11", "Num12", "Num13", "Num14", "Num15", "Num16", "Num17", "Num18", "Num19", "Num20", "Num21", "Num22", "Num23", "Num24", "Num25", "Num26", "Num27", "Num28", "Num29", "Num30", "Num31", "Num32", "Num33", "Num34", "Num35", "Num36"]
    let drawMark = ["Cross", ""]
    var numberOfDraws: Int = 0
    var drawNumbersArray = [Int]()      // initialisation the draw numbers array
    var EvenNum = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36]
    let smallNum = 18                   // small numbers from 1-18 inclusive
    let dozen1 = 12                     // 1st dozen from 1-12
    let dozen2 = 24                     // second dozen from 13-24
    let column1 = [1,4,7,10,13,16,19,22,25,28,31,34]
    let column2 = [2,5,8,11,14,17,20,23,26,29,32,35]
    let column3 = [3,6,9,12,15,18,21,24,27,30,33,36]
    let FrenchTires = [33,16,24,5,10,23,8,30,11,36,13,27]
    let FrenchOrphans = [1,20,14,31,9,6,34,17]
    let FrenchVoisins = [22,18,29,7,28,12,35,3,26,0,32,15,19,4,21,2,25]
    let FrenchJeu0 = [12,35,3,26,0,32,15]
    var test1:Float = 99.0
    var test2:String = ""
    var myNum: Int = 99
    // end of data
    // two extra functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // just
        print("check inide numberOfRowsInSection = \(drawNumbersArray.count)")
        return drawNumbersArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // cell object
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! myTableViewCell
        if drawNumbersArray.count > 0 {
            print("check inide cell count=",  drawNumbersArray.count)
            print("check inide cell indexPath= \(indexPath)")
            // draw number
            myNum = drawNumbersArray[indexPath.row]
            if (cell.contentView.viewWithTag(201) as? UIImageView) != nil {
                cell.drawNum.image = UIImage(named: drawNumbers[drawNumbersArray[indexPath.row]] + ".png")
            }
            
            // Odd Even Hi Low
            if myNum != 0 {
                // odd even number
                if EvenNum.contains(drawNumbersArray[indexPath.row]){
                    cell.Mark2.image = UIImage(named: "Cross.png")
                }
                else{
                    cell.Mark1.image = UIImage(named: "Cross.png")
                }
                // hi low number
                if myNum > 18{
                    cell.Mark3.image = UIImage(named: "Cross.png")
                }
                else{
                    cell.Mark4.image = UIImage(named: "Cross.png")
                }
                // Dozens
                if myNum < 13 {
                    cell.Mark5.image = UIImage(named: "Cross.png")
                }
                else if myNum > 24 {
                    cell.Mark7.image = UIImage(named: "Cross.png")
                }
                else {
                    cell.Mark6.image = UIImage(named: "Cross.png")
                }
                // Columns
                if column1.contains(myNum) {
                    cell.Mark8.image = UIImage(named: "Cross.png")
                }
                else if column3.contains(myNum)  {
                    cell.Mark10.image = UIImage(named: "Cross.png")
                }
                else {
                    cell.Mark9.image = UIImage(named: "Cross.png")
                }
                // French Bets 1:Tiers, 2:Voisins, 3:Orphans
                if FrenchTires.contains(myNum) {
                    cell.Mark11.image = UIImage(named: "Cross.png")
                }
                else if FrenchVoisins.contains(myNum)  {
                    cell.Mark12.image = UIImage(named: "Cross.png")
                }
                else {
                    cell.Mark13.image = UIImage(named: "Cross.png")
                }
            }
            else{       // Number 0 here
                cell.Mark12.image = UIImage(named: "Cross.png")
            }
            
        }

        return (cell)
    }
    

    
    // display
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableList.tableFooterView = UIView.init(frame: .zero)
        tableList.dataSource = self
        tableList.delegate = self
    }

    
    @IBAction func addButton(_ sender: UIButton) {
        // adding new row
        if inputNum.text != ""{
            numberOfDraws += 1
            print(" draw  \(numberOfDraws)")
            print("draw number = ", inputNum.text!)
            drawNumbersArray.insert(Int(inputNum.text!)!, at: 0)
            print("drawNumbersArray = \(drawNumbersArray)")
            tableList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
            //reset the input box
            inputNum.text = ""
        }
        else{
            print (" Error no input!")
        }

        
    }

}

