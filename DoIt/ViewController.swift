//
//  ViewController.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskList: UITableView!
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        taskList.dataSource = self
        taskList.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        taskList.reloadData()
    }
    
    @IBAction func onAddButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "addTaskSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
        }
    }
    
    func getTasks()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            try tasks = context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }
        catch
        {
            print("error")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if(tasks[indexPath.row].isImportant)
        {
            cell.textLabel?.text = "❗️\(tasks[indexPath.row].name!)"
        }
        else{
            cell.textLabel?.text = tasks[indexPath.row].name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }

    
}

