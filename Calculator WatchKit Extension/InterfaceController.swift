//
//  InterfaceController.swift
//  Calculator WatchKit Extension
//
//  Created by Anmol Sharma on 2019-11-06.
//  Copyright © 2019 anmol. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var calculatingBool : Bool = false
    
    var value = 0 //Initial value
    var preValue = 0
    var oper: String = ""
    //Calculator Display Label
    @IBOutlet weak var calDisp: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //Calculator no's
    @IBAction func one() {
        addToNumber(num: 1)
    }
    @IBAction func two() {
        addToNumber(num: 2)
    }
    @IBAction func three() {
        addToNumber(num: 3)
    }
    @IBAction func four() {
        addToNumber(num: 4)
    }
    @IBAction func five() {
        addToNumber(num: 5)
    }
    @IBAction func six() {
        addToNumber(num: 6)
    }
    @IBAction func seven() {
        addToNumber(num: 7)
    }
    @IBAction func eight() {
        addToNumber(num: 8)
    }
    @IBAction func nine() {
        addToNumber(num: 9)
    }
    @IBAction func zero() {
        addToNumber(num: 0)
    }
//    @IBAction func decimal() {
//    }
//
    //Math operations func
    @IBAction func add() {
        operatorPressed(op: "Add")
    }
    @IBAction func minus() {
        operatorPressed(op: "Min")
    }
    @IBAction func multiply() {
        operatorPressed(op: "Mul")
    }
    @IBAction func divide() {
        operatorPressed(op: "div")
    }
    @IBAction func result() {
        if (calculatingBool) {
            
            var tempRes = 0
            
            if (oper == "Add") {
                tempRes = preValue + value
                
            } else if (oper == "Sub") {
                tempRes = preValue - value
                
            } else if (oper == "Mul") {
                tempRes = preValue * value
                
            } else if (oper == "Div") {
                tempRes = preValue / value
                
            } else { //Error
                
            }
            
            calDisp.setText("\(tempRes)")
            calculatingBool = false
            
        } else {
            calDisp.setText("\(value)")
        }
    }
    
    //AC Function
    
    @IBAction func AC() {
        preValue = 0
        value = 0
        calDisp.setText("\(value)")
        calculatingBool = false
    }
    
    //adding
    func addToNumber(num : Int) {       // it will just increase number as they typed
        
        if (!calculatingBool) {
               
                   if (value == 0) {
                       calDisp.setText("\(num)")
                       value = num
                   } else {
                       let temp: String = String(value) + String(num)
                       value = Int(temp)!
                       calDisp.setText(temp)
                   }
                   
               } else { //Calculating--- Operator is pressed
                   
                   if (value == 0) {
                       calDisp.setText("\(num)")
                       value = num
                   } else {
                       let temp: String = String(value) + String(num)
                       value = Int(temp)!
                       calDisp.setText(temp)
                   }
                   
               }
    }
    
        //oprrator pressed
        func operatorPressed(op: String){
           
         if (!calculatingBool) {
               
               preValue = value
               value = 0
               
               if (op == "Add") {
                   oper = "Add"
                   calDisp.setText("+")
                   
               } else if (op == "Sub") {
                   oper = "Sub"
                   calDisp.setText("-")
                   
               } else if (op == "Mul") {
                   oper = "Mul"
                   calDisp.setText("*")
                   
               } else if (op == "Div") {
                   oper = "Div"
                   calDisp.setText("/")
                   
               } else { //Error
                   
               }
               
               calculatingBool = true
               
           }
            
           
           
        }
    }
