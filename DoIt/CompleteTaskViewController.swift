//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Bogdan A Galea on 2017-05-08.
//  Copyright © 2017 WhiteBelt Apps. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task =  Task()
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if task.important {
            
            taskLabel.text = "❗️ \(task.name)"
            
        } else {
            taskLabel.text = task.name
            
        }
        
        
    }
    
    
    
    
    @IBAction func completeTapped(_ sender: Any) {
        
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
}
