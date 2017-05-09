//
//  TasksViewController.swift
//  DoIt
//
//  Created by Bogdan A Galea on 2017-05-08.
//  Copyright © 2017 WhiteBelt Apps. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name
        
        if task.important {
            cell.textLabel?.text = "❗️ \(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    
    @IBAction func plusTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks() {
        
        let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            
        tasks = try contex.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        
        } catch {
            
            print("Error couldn't catch")
        
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "selectTaskSegue"{
            
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task!
           
            
        }
    }
    
}
