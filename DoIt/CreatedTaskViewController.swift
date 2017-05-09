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
    
    //connection to get to previcus viewcontroller
    var previousVC = TasksViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        //create a task from the textfield
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        
        //add new task to array in tableviewController
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
