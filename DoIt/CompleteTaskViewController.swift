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
    var task: Task? =  nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if (task?.important)! {
            
            taskLabel.text = "❗️ \(task!.name!)"
            
        } else {
            taskLabel.text = task!.name!
            
        }
        
        
    }
    
    
    
    
    @IBAction func completeTapped(_ sender: Any) {
        
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
}
