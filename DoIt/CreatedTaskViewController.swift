//
//  CreatedTaskViewController.swift
//  DoIt
//
//  Created by Bogdan A Galea on 2017-05-08.
//  Copyright © 2017 WhiteBelt Apps. All rights reserved.
//

import UIKit

class CreatedTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        //getting accec to appdelagate
       let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //create a task from the textfield
        let task = Task(context: context)
        
        task.name = taskNameTextField.text
        task.important = importantSwitch.isOn
        //saves to coredata savecontext function
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Pop back after adding item
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
